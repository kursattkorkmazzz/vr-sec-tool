import UnityGetFunctionHandler from "@implementations/UnityGetFunctionHandler";

(async () => {
  console.log("Main function called.");
  const unityGetFunctionHandler = new UnityGetFunctionHandler();
  const implementation = unityGetFunctionHandler.GetImplementation();
})();
