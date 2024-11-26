import UnityGetFunctionHandler from "./core/implementations/UnityGetFunctionHandler";

(async () => {
  console.log("Main function called.");
  const unityGetFunctionHandler = new UnityGetFunctionHandler();
  const implementation = unityGetFunctionHandler.GetImplementation();
})();
