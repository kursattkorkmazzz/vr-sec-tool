import IPlatform from "../interfaces/IPlatform";

export default class GameMechanics implements IPlatform {
  GameAssembly: Il2Cpp.Image;
  GameClass: Il2Cpp.Class;
  constructor() {
    this.GameAssembly = Il2Cpp.domain.assembly("Assembly-CSharp").image;
    this.GameClass = this.GameAssembly.class("GameData");
  }

  handleFunctions(): void {
    this.infiniteArmor();
    //Il2Cpp.trace(true).classes(this.GameClass).and().attach();
    return;
  }

  private infiniteArmor() {
    //public void SetArmor(float newArmorLevel)
    const SetArmor = this.GameClass.method("SetArmor");
    SetArmor.implementation = function (...params: Il2Cpp.Parameter.Type[]) {
      console.log("SetArmor was called with params: ", params);
      this.method<void>("SetArmor").invoke(10000);
    };
  }
}
