import WhitelistAuthorizator from "../authorizators/WhitelistAuthorizator";
import IAuthorizator from "../interfaces/IAuthorizator";
import IPlatform from "../interfaces/IPlatform";
import Logger from "../utils/Logger";
import UploadHandlerPayloadReader from "../utils/UploadHandlerPayloadReader";

export default class SystemSocket implements IPlatform {
  NetSocketAssembly: Il2Cpp.Image;

  constructor() {
    this.NetSocketAssembly = Il2Cpp.domain.assembly("System.Net.Http").image;
  }

  handleFunctions(): void {
    this.ListenAssembly();
  }

  private ListenAssembly() {
    Il2Cpp.trace(true)
      .assemblies(Il2Cpp.domain.assembly("System.Net.Http"))
      .and()
      .attach();
  }
}
