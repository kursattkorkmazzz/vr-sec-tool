import Config from "../config/Config";
import IPlatform from "../interfaces/IPlatform";
import Logger from "../utils/Logger";

const CHANGE_DATA = Config.CHANGE_DATA;
export default class UnityAnalyticsPlatform implements IPlatform {
  handleFunctions(): void {
    const start = Date.now();

    const UnityAnalyticsInternalAssembly = Il2Cpp.domain.tryAssembly(
      "Unity.Services.Analytics"
    );
    if (!UnityAnalyticsInternalAssembly) {
      Logger.warn(
        "UnityAnalyticsPlatform disabled because there is no specified module."
      );
      return;
    }
    const UnityAnalyticInternalImage = UnityAnalyticsInternalAssembly.image;
    const WebRequestHelper = UnityAnalyticInternalImage.tryClass(
      "Unity.Services.Analytics.Internal.WebRequestHelper"
    );
    if (!WebRequestHelper) return;
    const CreateWebRequest = WebRequestHelper.tryMethod("CreateWebRequest");
    if (!CreateWebRequest) return;

    Logger.success("UnityAnalyticsPlatform enabled.");

    if (CHANGE_DATA) {
      Logger.info("UnityAnalyticsPlatform data changing is activated.");
    }

    CreateWebRequest.implementation = function (
      this,
      ...params: Il2Cpp.Parameter.Type[]
    ) {
      const url = Il2Cpp.string(Config.MOCKUP_SERVER);
      const type = Il2Cpp.string("POST");

      const payloadObject = { AYBU: "VRSEC TEAM" };

      const changedPayload = Il2Cpp.array<number>(
        Il2Cpp.corlib.class("System.Byte"),
        JSON.stringify(payloadObject)
          .split("")
          .map((char) => char.charCodeAt(0))
      );
      return this.method("CreateWebRequest").invoke(
        url,
        type,
        CHANGE_DATA ? changedPayload : params[2]
      );
    };
    const duration = Date.now() - start;
    Config.TELEMETRY && Logger.info("Injection time: " + duration + "ms");
    Logger.info("UnityAnalyticsPlatform CreateWebRequest handler enabled.");
  }
}
