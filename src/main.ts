import "frida-il2cpp-bridge";
const URL = require("@frida/url");

import UnityNetworkingPlatform from "./core/platform/UnityNetworkingPlatform";

Il2Cpp.perform(() => {
  const unityNetworkingPlatform = new UnityNetworkingPlatform();
  unityNetworkingPlatform.handleFunctions();

  ///Il2Cpp.trace(true).classes(UnityWebRequest).and().attach();
});
