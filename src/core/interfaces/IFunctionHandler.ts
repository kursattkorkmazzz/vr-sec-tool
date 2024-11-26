export default interface IFunctionHandler {
  GetImplementation: () => () => void;
}
