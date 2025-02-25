import "frida-il2cpp-bridge";
const URL = require("@frida/url");

import UnityNetworkingPlatform from "./core/platform/UnityNetworkingPlatform";
import GameMechanics from "./core/platform/GameMechanics";
import SystemNetwork from "./core/platform/SystemNetworkingPlatform";
import DLLs from "./core/platform/DLLsPlatform";
Il2Cpp.perform(() => {
  const dllS= new DLLs();
  dllS.handleFunctions(); 
  //const systemNetwork = new SystemNetwork();
  //systemNetwork.handleFunctions();
  //const unityNetworkingPlatform = new UnityNetworkingPlatform();
  //unityNetworkingPlatform.handleFunctions();
  //const gameMechanics = new GameMechanics();
  //gameMechanics.handleFunctions();
  ///Il2Cpp.trace(true).classes(UnityWebRequest).and().attach();
});