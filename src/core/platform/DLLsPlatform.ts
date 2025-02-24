import IPlatform from "../interfaces/IPlatform";

export default class DLLs implements IPlatform {
  NetworkAssemblies: Il2Cpp.Assembly[];
  constructor() {
    this.NetworkAssemblies = Il2Cpp.domain.assemblies;
  };

  handleFunctions(): void {
    this.listenNetworkClasses();
    return;
  }

  private listenAllDlls():void{
    Il2Cpp.trace(true).assemblies(...Il2Cpp.domain.assemblies).and().attach();
  }

  private listenNetworkClasses():void {
    let  NetworkClasses:Il2Cpp.Class[] = [];
    this.NetworkAssemblies.forEach((assembly) => {
      assembly.image.classes.forEach((klass) =>{
        if(klass.name.toLowerCase().includes("http")|| klass.name.toLowerCase().includes("network") || klass.name.toLowerCase().includes("web") ){
          NetworkClasses.push(klass);
        }
      })
    })
    if (!NetworkClasses) {
      console.log("NetworkClasses is null or undefined");
      return;
  }

  // Check if array is empty
  if (NetworkClasses.length === 0) {
      console.log("No network classes found");
      return;
  }
    console.log("Finding Classes \n :");
    NetworkClasses.forEach((klass) => {
      console.log(klass.name);
    })
    Il2Cpp.trace(true).classes(...NetworkClasses).and().attach();
  }

};