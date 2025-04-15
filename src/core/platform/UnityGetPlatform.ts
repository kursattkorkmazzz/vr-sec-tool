import WhitelistAuthorizator from "../authorizators/WhitelistAuthorizator";
import IAuthorizator from "../interfaces/IAuthorizator";
import IPlatform from "../interfaces/IPlatform";
import Logger from "../utils/Logger";
import UploadHandlerPayloadReader from "../utils/UploadHandlerPayloadReader";

export default class UnityGetPlatform implements IPlatform {
  UnityAnalyticsInternalAssembly: Il2Cpp.Image;
  WebRequestHelper: Il2Cpp.Class;
  CreateWebRequest: Il2Cpp.Method;

  constructor() {
    this.UnityAnalyticsInternalAssembly = Il2Cpp.domain.assembly(
      "Unity.Services.Analytics"
    ).image;
    this.WebRequestHelper = this.UnityAnalyticsInternalAssembly.class(
      "Unity.Services.Analytics.Internal.WebRequestHelper"
    );
    this.CreateWebRequest = this.WebRequestHelper.method("CreateWebRequest")

    
  }

  handleFunctions(): void {
    this.injection();
    //Il2Cpp.trace(true).methods(this.CreateWebRequest).and().attach();
    return;
  }

  private injection(): void {
    this.CreateWebRequest.implementation = function (this,...params: Il2Cpp.Parameter.Type[]) {
      const url = Il2Cpp.string("https://mock-bdae381a474442bf961d953a4caf67e7.mock.insomnia.rest/pistol");
      const type = Il2Cpp.string("POST");
      return this.method("CreateWebRequest").invoke( url,type,params[2] );
    };
  }
}
