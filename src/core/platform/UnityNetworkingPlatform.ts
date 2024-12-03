import WhitelistAuthorizator from "../authorizators/WhitelistAuthorizator";
import IAuthorizator from "../interfaces/IAuthorizator";
import IPlatform from "../interfaces/IPlatform";

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
    console.log("[Unity Networking] Get Function is injecting...");

    const GetMethod: Il2Cpp.Method = this.UnityWebRequest.method("Get");
    GetMethod.implementation = (...parameters: Il2Cpp.Parameter.Type[]) => {
      //TODO GetMethod implementation will be write!
    };
  }
}
