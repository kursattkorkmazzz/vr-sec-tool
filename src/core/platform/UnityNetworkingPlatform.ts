import WhitelistAuthorizator from "../authorizators/WhitelistAuthorizator";
import IAuthorizator from "../interfaces/IAuthorizator";
import IPlatform from "../interfaces/IPlatform";
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
    //this.postFunctionHandler();
    this.getFunctionHandler();
  }

  private postFunctionHandler() {
    console.log("[Unity Networking] Post Function is injecting...");

    const PostFormMethod: Il2Cpp.Method =
      this.UnityWebRequest.method("PostWwwForm");

    PostFormMethod.implementation = (
      ...parameters: Il2Cpp.Parameter.Type[]
    ) => {
      const isAuthorized: boolean = this.authorizator.authorize(parameters[0]);

      if (!isAuthorized) {
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