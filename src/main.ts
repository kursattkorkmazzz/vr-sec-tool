import "frida-il2cpp-bridge";
import UnityGetFunctionHandler from "./core/implementations/UnityGetFunctionHandler";

const handler = new UnityGetFunctionHandler();
handler.GetImplementation();
Il2Cpp.perform(() => {
  console.log("Modding operation is started.");
});
