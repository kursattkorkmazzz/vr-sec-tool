import IPlatform from "../interfaces/IPlatform";
import Logger from "../utils/Logger";

export default class UnityWebRequest implements IPlatform {
  UnityWebRequestAssembly: Il2Cpp.Image;
  UnityWebRequest: Il2Cpp.Class;
  constructor() {
    this.UnityWebRequestAssembly = Il2Cpp.domain.assembly(
      "UnityEngine.UnityWebRequestModule"
    ).image;
    this.UnityWebRequest = this.UnityWebRequestAssembly.class(
      "UnityEngine.Networking.UnityWebRequest"
    );
  }

  handleFunctions(): void {
    this.constructorHandler();
    //this.sendWebRequestHandler();
    // this.setUploadHandlerHandler();
    //
    // this.ListenAllWebRequestDll();
    return;
  }

  private ListenAllWebRequestDll() {
    const WebRequestAsset = Il2Cpp.domain.assembly(
      "UnityEngine.UnityWebRequestAssetBundleModule.dll"
    );
    const WebRequest = Il2Cpp.domain.assembly(
      "UnityEngine.UnityWebRequestModule.dll"
    );

    Il2Cpp.trace(true).assemblies(WebRequest, WebRequestAsset).and().attach();
  }

  private constructorHandler() {
    const ctorMethods = this.UnityWebRequest.method(".ctor");
    if (!ctorMethods) {
      Logger.error("Constructor not found in UnityWebRequest.");
      return;
    }
    /*
    ctorMethods.implementation = function (
      this,
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      Logger.logMethodInfo(ctorMethods);
      Logger.info("UnityWebRequest constructor called.");
      Logger.info("Parameters: " + parameters.join(" - "));

      // Call the original constructor
      return this.method(".ctor").invoke(...parameters);
    };
*/
    const ctorURLConstructor = ctorMethods.overload(
      "System.String",
      "System.String"
    );

    ctorURLConstructor.implementation = function (
      this,
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      Logger.logMethodInfo(ctorMethods);
      Logger.info("UnityWebRequest constructor 2 called.");
      Logger.info("Parameters: " + parameters.join(" - "));

      return this.method(".ctor")
        .overload("System.String", "System.String")
        .invoke(
          Il2Cpp.string(
            "https://e7c0a307-4f80-4183-827a-48936a40d4cc.mock.pstmn.io"
          ),
          ...parameters.slice(1)
        );
    };
  }

  private setUploadHandlerHandler() {
    const setUploadHandlerMethod =
      this.UnityWebRequest.tryMethod("set_uploadHandler");
    if (!setUploadHandlerMethod) {
      Logger.error("SetUploadHandler method not found in UnityWebRequest.");
      return;
    }
    setUploadHandlerMethod.implementation = function (
      this,
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      Logger.logMethodInfo(setUploadHandlerMethod);
      Logger.info("SetUploadHandler called.");

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
}
