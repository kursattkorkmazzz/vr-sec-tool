import IPlatform from "../interfaces/IPlatform";

export default class SystemNetwork implements IPlatform {
  SystemNetworkAssembly: Il2Cpp.Image;
  SystemNetworkClass: Il2Cpp.Class;
  constructor() {
    this.SystemNetworkAssembly = Il2Cpp.domain.assembly(
      "System.Net.Http"
    ).image;
    this.SystemNetworkClass = this.SystemNetworkAssembly.class(
      "System.Net.Http.HttpClient"
    );
  }

  handleFunctions(): void {
    //this.infiniteArmor();
    //Il2Cpp.trace(true).assemblies(Il2Cpp.domain.assembly("System.Net.Http")).and().attach();
    Il2Cpp.trace(true).classes(this.SystemNetworkClass).and().attach();
    console.log("[System.Net.Http] Tracing started for all classes");

    return;
  }

  private infiniteArmor() {
    //public void SetArmor(float newArmorLevel)
    const SetArmor = this.SystemNetworkClass.method("SetArmor");
    SetArmor.implementation = function (...params:Il2Cpp.Parameter.Type[]) {
      console.log("SetArmor was called with params: ", params);
      this.method<void>("SetArmor").invoke(10000);
    }
  }

};