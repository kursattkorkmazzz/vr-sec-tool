import WhitelistAuthorizator from "../authorizators/WhitelistAuthorizator";
import IAuthorizator from "../interfaces/IAuthorizator";
import IPlatform from "../interfaces/IPlatform";
import Logger from "../utils/Logger";
import UploadHandlerPayloadReader from "../utils/UploadHandlerPayloadReader";

export default class UnityNetworkingPlatform implements IPlatform {
  UnityWebRequestAssembly: Il2Cpp.Image;
  UnityWebRequest: Il2Cpp.Class;
  authorizator: IAuthorizator;

  constructor() {
    this.UnityWebRequestAssembly = Il2Cpp.domain.assembly(
      "UnityEngine.UnityWebRequestModule"
    ).image;
    this.UnityWebRequest = this.UnityWebRequestAssembly.class(
      "UnityEngine.Networking.UnityWebRequest"
    );
    this.authorizator = new WhitelistAuthorizator();
  }

  handleFunctions(): void {
    // console.log(this.UnityWebRequest.methods.map((m) => m).join("\n\n"));
    /*
    const sendWebRequestMethod =
      this.UnityWebRequest.tryMethod("SendWebRequest");
    if (!sendWebRequestMethod) {
      Logger.error("SendWebRequest method not found in UnityWebRequest.");
      return;
    }

    sendWebRequestMethod.implementation = function (
      this,
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      const getUrlMethod = this.method<Il2Cpp.String>("get_url");

      Logger.warn((this as Il2Cpp.Object).class.methods.join("\n\n"));
      Logger.error((this as Il2Cpp.Object).class.fields.join("\n\n"));

      //const methodProperty = this.field<Il2Cpp.String>("method");

      let url = getUrlMethod.invoke().content;
      //let method = methodProperty;

      Logger.info(
        `Intercepted UnityWebRequest - Method: "undefined", URL: ${url}`
      );

      //const setUrlMethod = this.method<void>("set_url");
      this.method<void>("set_url").invoke(
        Il2Cpp.string(
          "https://mock-bdae381a474442bf961d953a4caf67e7.mock.insomnia.rest/pistolweapon"
        )
      );

      Logger.info("New Setted URL: " + getUrlMethod.invoke().content);

      const result = this.method("SendWebRequest").invoke(...parameters);
      Logger.error("SendWebRequest result: ", result);

      return result;
    };
    */
    /*
    const ctor = this.UnityWebRequest.method(".ctor");
    if (!ctor) {
      Logger.error("Constructor not found in UnityWebRequest.");
      return;
    }

    ctor.implementation = function (
      this,
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      Logger.info("UnityWebRequest constructor called.");
      const url = parameters[0];
      const method = parameters[1];

      Logger.info(`URL: ${url}, Method: ${method}`);

      Logger.logMethodInfo(ctor);
      Logger.warn("Gurkan enjekte edildi merak etme.");
      // Call the original constructor
      return this.method<void>(".ctor").invoke(
        Il2Cpp.string(
          "https://mock-bdae381a474442bf961d953a4caf67e7.mock.insomnia.rest/pistolweapon"
        ),
        parameters[1]
      );
    };
    */
  }

  /**
   * Handles the injection of the post function for Unity Networking.
   *
   * This method sets up a logger category for "Unity Networking" and logs the injection process.
   * It retrieves the `PostWwwForm` method from `UnityWebRequest` and overrides its implementation.
   *
   * The new implementation checks if the request is authorized using the `authorizator` object.
   * If the request is not authorized, it logs an error message and prevents the form from being sent.
   * If the request is authorized, it invokes the original `PostWwwForm` method with the provided parameters.
   *
   * Finally, it logs a success message indicating that the post function has been injected.
   *
   * @private
   */
  private postFunctionHandler() {
    Logger.setCategory("Unity Networking");
    Logger.info("Post Function is injecting...");

    const PostFormMethod: Il2Cpp.Method =
      this.UnityWebRequest.method("PostWwwForm");

    PostFormMethod.implementation = (
      ...parameters: Il2Cpp.Parameter.Type[]
    ) => {
      const isAuthorized: boolean = this.authorizator.authorize(parameters[0]);

      if (!isAuthorized) {
        Logger.error(
          "Post Form is not send because the target host and port is not permited."
        );
        return;
      }
      let result: Il2Cpp.Method.ReturnType = PostFormMethod.invoke(
        ...parameters
      );

      return result;
    };

    console.log("[Unity Networking] Post Function is injected.");
  }
  private getFunctionHandler() {
    const GetMethod = this.UnityWebRequest.method("Get");

    GetMethod.implementation = (...parameters: Il2Cpp.Parameter.Type[]) => {
      let url = parameters[0];
      console.log("URL: ", url);
      const isAuthorized: boolean = this.authorizator.authorize(url);
      if (!isAuthorized) {
        console.error("Unauthorized request to: ", url);
        return;
      }
      return GetMethod.invoke(url);
    };
  }
  private set_urlHandler() {
    const setUrlMethod = this.UnityWebRequest.method<void>("set_url");
    setUrlMethod.implementation = function (
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      const string = Il2Cpp.string("Test");
      console.log("set_url was called with params: ", parameters);
      const result = this.method<void>("set_url").invoke(string);
      console.log("Set Result: ", result);
      //return this.method<void>("set_url").invoke(string);
    };
  }
  private set_uriHandler() {
    const setUriMethod = this.UnityWebRequest.method<void>("set_uri");
    setUriMethod.implementation = function (
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      const string = Il2Cpp.string("Test");
      console.log("set_uri was called with params: ", parameters);
      const result = this.method<void>("set_uri").invoke(parameters[0]);
      console.log("SetURI Result: ", result);
      //return this.method<void>("set_url").invoke(string);
    };
  }
  private get_urlHandler() {
    const getUrlMethod = this.UnityWebRequest.method<void>("get_url");
    getUrlMethod.implementation = function (
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      console.log("set_url was called with params: ", parameters);
      const result = this.method<void>("get_url").invoke();
      console.log("Get Result: ", result);
      return;
    };
  }
  private uriUrlHandler() {
    const sendWebRequestMethod =
      this.UnityWebRequest.tryMethod("SendWebRequest");
    if (!sendWebRequestMethod) {
      Logger.error("SendWebRequest method not found in UnityWebRequest.");
      return;
    }

    sendWebRequestMethod.implementation = function (
      this,
      ...parameters: Il2Cpp.Parameter.Type[]
    ) {
      this.method<void>("set_url").invoke(
        Il2Cpp.string(
          "https://mock-bdae381a474442bf961d953a4caf67e7.mock.insomnia.rest/pistolweapon"
        )
      );

      Logger.error(
        Il2Cpp.domain.assembly("netstandard").image.classes.join("\n\n")
      );
      /*
      const URIClass = Il2Cpp.corlib.class("System.Uri");

      const newURIObject = URIClass.method(".ctor")
        .overload("System.String")
        .invoke(
          Il2Cpp.string(
            "https://mock-bdae381a474442bf961d953a4caf67e7.mock.insomnia.rest/pistolweapon"
          )
        );
      this.method<void>("set_uri").invoke(newURIObject as Il2Cpp.Object);
*/
      const result = this.method("SendWebRequest").invoke(...parameters);
      Logger.error("SendWebRequest result: ", result);
      return result;
    };
  }
}
