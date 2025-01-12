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
    this.postFunctionHandler();
    this.getFunctionHandler();
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
    //Il2Cpp.trace(true).classes(this.UnityWebRequest).and().attach();
    /*console.log("Fields of UnityWebRequest:");
    this.UnityWebRequest.fields.forEach((field) => {
      console.log(field.name);
      console.log();
    });
    console.log("-----------------------");
    this.UnityWebRequest.field("Url").value = "http:sel";
  }*/
    /* const set_url = this.UnityWebRequest.method("set_url");
 
     set_url.implementation = (...parameters: Il2Cpp.Parameter.Type[]) => {
       const url = parameters[0];
       console.log("URL: ", url);
       console.log("Type: ", set_url.returnType);
       const isAuthorized: boolean = this.authorizator.authorize(url);
       if (!isAuthorized) {
         return;
       }else{
 
       }
     };
   }*/

    const GetMethod = this.UnityWebRequest.method("Get");

    GetMethod.implementation = (...parameters: Il2Cpp.Parameter.Type[]) => {
      let url = parameters[0];
      console.log("URL: ", url);
      const isAuthorized: boolean = this.authorizator.authorize(url);
      //if (!isAuthorized) {
     //   console.error("Unauthorized request to: ", url);  
      //  return;
     // }
      return GetMethod.invoke(url);
    };
  }
}