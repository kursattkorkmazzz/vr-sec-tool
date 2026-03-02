import Logger from "./Logger";

/**
 * Reads the payload from the upload handler of a instance of class.
 *
 * @param {Il2Cpp.Object} instance - The instance object from which to read the upload handler payload.
 * @returns {String} The payload data as a string, or empty if error happened.
 */
export default function UploadHandlerPayloadReader(
  instance: Il2Cpp.Object
): String {
  const uploadHandler = (instance as Il2Cpp.Object).tryMethod<Il2Cpp.Object>(
    "get_uploadHandler"
  );
  if (uploadHandler && uploadHandler.virtualAddress.toInt32() != 0) {
    const uploadHandlerRaw = uploadHandler.invoke() as Il2Cpp.Object;

    if (uploadHandlerRaw.handle.toInt32() == 0x0) {
      return "";
    }

    const payload = uploadHandlerRaw.tryField("m_Payload");
    if (payload) {
      const payload_pointer = (payload.value as Il2Cpp.ValueType).box();
      const itemLength = payload_pointer
        .method("get_Length")
        .invoke() as number;
      const getItemMethod = payload_pointer.method("get_Item");
      let payloadData: string = "";

      for (let i = 0; i < itemLength; i++) {
        payloadData += String.fromCharCode(getItemMethod.invoke(i) as number);
      }
      return payloadData;
    }
  }

  return "";
}
