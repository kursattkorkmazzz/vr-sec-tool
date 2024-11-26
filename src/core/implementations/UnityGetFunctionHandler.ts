import IFunctionHandler from "../interfaces/IFunctionHandler";

export default class UnityGetFunctionHandler implements IFunctionHandler {
  public GetImplementation(): () => void {
    console.log("UnityGetFunctionHandler called.");
    return () => {
      console.log("UnityGetFunctionHandler implementation called.");
    };
  }
}
