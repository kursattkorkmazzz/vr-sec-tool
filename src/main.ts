import "frida-il2cpp-bridge";
const URL = require("@frida/url");

import UnityNetworkingPlatform from "./core/platform/UnityNetworkingPlatform";
import GameMechanics from "./core/platform/GameMechanics";
Il2Cpp.perform(() => {
  //const unityNetworkingPlatform = new UnityNetworkingPlatform();
  //unityNetworkingPlatform.handleFunctions();
  const gameMechanics = new GameMechanics();
  gameMechanics.handleFunctions();
  ///Il2Cpp.trace(true).classes(UnityWebRequest).and().attach();
});
