import "frida-il2cpp-bridge";
import UnityWebRequestPlatform from "./core/platform/UnityWebRequestPlatform";
import UnityAnalyticsPlatform from "./core/platform/UnityAnalyticsPlatform";
import Config from "./core/config/Config";

Il2Cpp.perform(() => {
  if (Config.JUST_LISTEN) {
    ListenAllWebRequestDll();
  } else {
    const unityWebRequestPlatform = new UnityWebRequestPlatform();
    unityWebRequestPlatform.handleFunctions();
    const unityAnalyticsPlatform = new UnityAnalyticsPlatform();
    unityAnalyticsPlatform.handleFunctions();
  }
});

function ListenAllWebRequestDll() {
  const assemblies: Il2Cpp.Assembly[] = [];

  const WebRequest = Il2Cpp.domain.tryAssembly(
    "UnityEngine.UnityWebRequestModule.dll"
  );
  if (WebRequest) assemblies.push(WebRequest);

  /*
  const Analytics = Il2Cpp.domain.assembly("Unity.Services.Analytics");
  if (Analytics) assemblies.push(Analytics);
*/
  Il2Cpp.trace(true)
    .assemblies(...assemblies)
    .and()
    .attach();
}
