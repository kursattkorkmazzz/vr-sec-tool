#!/usr/bin/env bash
folder_name="$1"
apk_base="$2"
obb_base="$3"


# Check if the required arguments are provided
if [[ -z $apk_base || -z $folder_name ]];
then
    echo "Usage: $0 <folder_name> <apk_base> <obb_base>"
    exit 1
fi


function get_apk {
    mkdir "./$folder_name"
    echo "Pulling APK from device => $apk_base"
    adb pull $apk_base ./$folder_name/original.apk
    return $?
}

get_apk_result=$(get_apk)
if [[ $get_apk_result -ne 0 ]]; then
    echo "Failed to pull APK from device."
    exit 1
fi


function get_obb {
    mkdir "./$folder_name/obb"
    echo "Pulling OBB from device => $obb_base"
    adb pull /storage/self/primary/Android/obb/${obb_base} ./$folder_name/obb/
    return $?
}

get_obb_reult=$(get_obb);


function injection_apk {
    echo "Injecting APK"
    frida-gadget ./$folder_name/original.apk  --arch arm64 --sign 
    mv ./$folder_name/original/dist/original-aligned-debugSigned.apk ./$folder_name/injected.apk
    return $?
}

injection_apk_result=$(injection_apk)

if [[ $injection_apk_result -ne 0 ]]; then
    echo "Failed to inject APK."
    exit 1
fi

# Remove original APK from device.
function remove_original_apk {
    echo "Removing original APK from device"
    adb uninstall $obb_base
    return $?
}

remove_original_apk_result=$(remove_original_apk)

# Push the injected APK to the device
function push_injected_apk {
    echo "Pushing injected APK to device"
    adb install ./$folder_name/injected.apk
    echo "Injected APK pushed successfully."
    return $?
}

push_injected_apk_result=$(push_injected_apk)
if [[ $push_injected_apk_result -ne 0 ]]; then
    echo "Failed to push injected APK to device."
    exit 1
fi


# If OBB exists, push it to the device
function push_obb {
    if [[ -n "$(ls -A ./$folder_name/obb/$obb_base)" ]]; then
        echo "Pushing OBB to device => $obb_base"
        adb push ./$folder_name/obb/ /storage/self/primary/Android/${obb_base}/
        echo "OBB pushed successfully."
        return 0
    else
        echo "No OBB directory found, skipping OBB push."
        return 1
    fi
}

push_obb_result=$(push_obb)
if [[ $push_obb_result -ne 0 ]]; then
    echo "Failed to push OBB to device."
    exit 1
fi
echo "Injection and push completed successfully."



