import { log } from "console";
import WhitelistAuthorizator from "../authorizators/WhitelistAuthorizator";
import IAuthorizator from "../interfaces/IAuthorizator";
import IPlatform from "../interfaces/IPlatform";
import Logger from "../utils/Logger";
import UploadHandlerPayloadReader from "../utils/UploadHandlerPayloadReader";

export default class UnityAnalyticsPlatform implements IPlatform {
  private UnityAnalyticsInternalAssembly: Il2Cpp.Image;
  private WebRequestHelper: Il2Cpp.Class;
  private CreateWebRequest: Il2Cpp.Method;

  constructor() {
    this.UnityAnalyticsInternalAssembly = Il2Cpp.domain.assembly(
      "Unity.Services.Analytics"
    ).image;
    this.WebRequestHelper = this.UnityAnalyticsInternalAssembly.class(
      "Unity.Services.Analytics.Internal.WebRequestHelper"
    );
    this.CreateWebRequest = this.WebRequestHelper.method("CreateWebRequest");
  }

  handleFunctions(): void {
    const start = Date.now();
    this.injection();
    const end = Date.now();
    const duration = end - start;
    console.log(`time took to inject :) ${duration} ms`);
    //Il2Cpp.trace(true).methods(this.CreateWebRequest).and().attach();
    return;
  }

  private injection(): void {
    this.CreateWebRequest.implementation = function (
      this,
      ...params: Il2Cpp.Parameter.Type[]
    ) {
      Logger.info("Method handled");
      const url = Il2Cpp.string(
        "https://mock-bdae381a474442bf961d953a4caf67e7.mock.insomnia.rest/pistolweapon"
      );
      const type = Il2Cpp.string("POST");
      //const payload = Il2Cpp.array<number>( Il2Cpp.corlib.class("System.Byte"), [0x56 ,0x52 ,0x20 ,0x53 ,0x45 ,0x43 ,0x20 ,0x54,0x45 ,0x41,0x4D]);

      const payloadString = String.fromCharCode(...(params[2] as any));
      const payloadObject = JSON.parse(payloadString);

      payloadObject["INJECTED_BY"] = "VR_SEC_TEAM";
      const payload = Il2Cpp.array<number>(
        Il2Cpp.corlib.class("System.Byte"),
        JSON.stringify(payloadObject)
          .split("")
          .map((char) => char.charCodeAt(0))
      );
      Logger.info("Payload: ", JSON.stringify(payloadObject));
      return this.method("CreateWebRequest").invoke(url, type, payload);
    };
  }
}
