/**
 * Silent Shield - VR Security Tool
 * Main entry point for Frida instrumentation script
 * 
 * This script hooks into Unity-based VR applications to intercept,
 * monitor, and optionally modify network requests for privacy analysis.
 * 
 * @author Ankara Yildirim Beyazit University - VR Security Research Team
 * @see https://github.com/AybuVRSEC/vr-sec-tool
 */

import "frida-il2cpp-bridge";
import UnityWebRequestPlatform from "./core/platform/UnityWebRequestPlatform";
import UnityAnalyticsPlatform from "./core/platform/UnityAnalyticsPlatform";
import Config from "./core/config/Config";

/**
 * Main execution entry point.
 * Initializes IL2CPP bridge and sets up network request interception.
 * 
 * Operation modes:
 * - JUST_LISTEN=true: Passive monitoring mode - traces all web request calls
 * - JUST_LISTEN=false: Active interception mode - hooks and modifies requests
 */
Il2Cpp.perform(() => {
  if (Config.JUST_LISTEN) {
    // Passive mode: Only trace/log network activity without modification
    ListenAllWebRequestDll();
  } else {
    // Active mode: Hook and intercept network requests
    const unityWebRequestPlatform = new UnityWebRequestPlatform();
    unityWebRequestPlatform.handleFunctions();
    
    const unityAnalyticsPlatform = new UnityAnalyticsPlatform();
    unityAnalyticsPlatform.handleFunctions();
  }
});

/**
 * Enables passive tracing of all UnityWebRequest module calls.
 * This function attaches IL2CPP tracers to monitor network activity
 * without modifying the application's behavior.
 * 
 * Useful for initial reconnaissance and understanding app network patterns.
 */
function ListenAllWebRequestDll(): void {
  const assemblies: Il2Cpp.Assembly[] = [];

  // Attempt to load the Unity Web Request module
  const WebRequest = Il2Cpp.domain.tryAssembly(
    "UnityEngine.UnityWebRequestModule.dll"
  );
  if (WebRequest) assemblies.push(WebRequest);

  // Note: Unity Analytics module can also be traced if needed
  // const Analytics = Il2Cpp.domain.assembly("Unity.Services.Analytics");
  // if (Analytics) assemblies.push(Analytics);

  // Attach tracers to all methods in the specified assemblies
  Il2Cpp.trace(true)
    .assemblies(...assemblies)
    .and()
    .attach();
}
