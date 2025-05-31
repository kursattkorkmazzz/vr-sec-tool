import Config from "../config/Config";

import IPlatform from "../interfaces/IPlatform";
import isValidUrl from "../utils/isValidUrl";
import Logger from "../utils/Logger";
const CHANGE_DATA = Config.CHANGE_DATA;
export default class UnityWebRequestPlatform implements IPlatform {
  handleFunctions(): void {
    const start = Date.now();
    const UnityWebRequestAssembly = Il2Cpp.domain.tryAssembly(
      "UnityEngine.UnityWebRequestModule"
    );
    if (!UnityWebRequestAssembly) {
      Logger.warn("UnityWebRequestPlatform disabled.");
      return;
    }
    const UnityWebRequestAssemblyImage = UnityWebRequestAssembly.image;
    const UnityWebRequest = UnityWebRequestAssemblyImage.tryClass(
      "UnityEngine.Networking.UnityWebRequest"
    );
    if (!UnityWebRequest) return;

    const ctorMethods = UnityWebRequest.method(".ctor");
    if (!ctorMethods) return;

    Logger.success("UnityWebRequestPlatform enabled.");

    // #region Constructor handlers

    // String constructor handler.
    const ctorJustUrl = ctorMethods.tryOverload("System.String");
    if (ctorJustUrl) {
      ctorJustUrl.implementation = function (
        this,
        ...parameters: Il2Cpp.Parameter.Type[]
      ) {
        const url = parameters[0] as Il2Cpp.String;
        const isValid = isValidUrl(url.content);

        return this.method(".ctor")
          .overload("System.String")
          .invoke(
            isValid && Config.JUST_LISTEN
              ? Il2Cpp.string(Config.MOCKUP_SERVER)
              : parameters[0]
          );
      };
      Logger.success(
        "UnityWebRequestPlatform (String) constructor handler enabled."
      );
    }

    // String String constructor handler.
    const ctorURLConstructor = ctorMethods.tryOverload(
      "System.String",
      "System.String"
    );

    if (ctorURLConstructor) {
      ctorURLConstructor.implementation = function (
        this,
        ...parameters: Il2Cpp.Parameter.Type[]
      ) {
        return this.method(".ctor")
          .overload("System.String", "System.String")
          .invoke(Il2Cpp.string(Config.MOCKUP_SERVER), ...parameters.slice(1));
      };

      Logger.success(
        "UnityWebRequestPlatform (String,String) constructor handler enabled."
      );
    }

    // String String DownloadHandler UploadHandler constructor handler.
    const UploadHandlerClass = Il2Cpp.domain
      .assembly("UnityEngine.UnityWebRequestModule")
      .image.class("UnityEngine.Networking.UploadHandler");
    const DownloadHandlerClass = Il2Cpp.domain
      .assembly("UnityEngine.UnityWebRequestModule")
      .image.class("UnityEngine.Networking.DownloadHandler");

    const ctorUrlDownloadHandlerUploadHandler = ctorMethods.tryOverload(
      "System.String",
      "System.String",
      DownloadHandlerClass.fullName,
      UploadHandlerClass.fullName
    );

    if (ctorUrlDownloadHandlerUploadHandler) {
      ctorUrlDownloadHandlerUploadHandler.implementation = function (
        this,
        ...parameters: Il2Cpp.Parameter.Type[]
      ) {
        return this.method(".ctor")
          .overload(
            "System.String",
            "System.String",
            DownloadHandlerClass.fullName,
            UploadHandlerClass.fullName
          )
          .invoke(Il2Cpp.string(Config.MOCKUP_SERVER), ...parameters.slice(1));
      };
      Logger.success(
        "UnityWebRequestPlatform (String,String,DownloadHandler,UploadHandler) constructor handler enabled."
      );
    }

    if (CHANGE_DATA) {
      this.setUploadHandlerHandler(UnityWebRequest);
      Logger.info("UnityWebRequestPlaform data changing activated.");
    }

    this.setUrlHandler(UnityWebRequest);

    const duration = Date.now() - start;
    Config.TELEMETRY && Logger.info("Injection time: " + duration + "ms");
    return;
  }
  // #endregion

  private setUploadHandlerHandler(UnityWebRequestClass: Il2Cpp.Class) {
    const setUploadHandlerMethod =
      UnityWebRequestClass.tryMethod("set_uploadHandler");
    if (!setUploadHandlerMethod) {
      Logger.error("SetUploadHandler method not found in UnityWebRequest.");
      return;
    }
    setUploadHandlerMethod.implementation = function (this) {
      // Check if the first parameter is an instance of UploadHandlerRaw
      const uploadHandlerRawClass = Il2Cpp.domain
        .assembly("UnityEngine.UnityWebRequestModule")
        .image.class("UnityEngine.Networking.UploadHandlerRaw");

      if (!uploadHandlerRawClass) {
        Logger.error("UploadHandlerRaw class not found.");
        return;
      }

      // Define your custom payload (data to upload)
      const payload = Il2Cpp.array<number>(
        Il2Cpp.corlib.class("System.Byte"),
        [
          123, 10, 34, 65, 89, 66, 85, 34, 58, 34, 86, 82, 32, 83, 69, 67, 84,
          69, 65, 77, 34, 10, 125,
        ]
      );

      // Create a new UploadHandlerRaw instance with the custom payload
      const newUploadHandler = uploadHandlerRawClass.alloc(); // Allocate memory for the object
      const uploadHandlerRawCtor = newUploadHandler.tryMethod(".ctor");
      if (!uploadHandlerRawCtor) {
        Logger.error("UploadHandlerRaw constructor not found.");
        return;
      }
      uploadHandlerRawCtor.invoke(payload); // Call the constructor on the allocated object

      Logger.info("Custom UploadHandlerRaw created with payload.");

      // Replace the original upload handler with the new one
      return this.method("set_uploadHandler").invoke(
        newUploadHandler as Il2Cpp.Parameter.Type
      );
    };
  }

  private setUrlHandler(UnityWebRequestClass: Il2Cpp.Class) {
    const setUrlMethod = UnityWebRequestClass.tryMethod("set_url");
    if (!setUrlMethod) {
      Logger.error("set_url method not found in UnityWebRequest.");
      return;
    }

    setUrlMethod.implementation = function (
      this,
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      const url = Il2Cpp.string(Config.MOCKUP_SERVER);
      return this.method("set_url").invoke(url);
    };
    Logger.success("UnityWebRequestPlatform set_url handler enabled.");
  }
}
