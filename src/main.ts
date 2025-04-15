import "frida-il2cpp-bridge";
const URL = require("@frida/url");

import UnityNetworkingPlatform from "./core/platform/UnityNetworkingPlatform";
import UnityAnalyticsPlatform from "./core/platform/UnityAnalyticsPlatform";
import GameMechanics from "./core/platform/GameMechanics";
import SystemNetwork from "./core/platform/SystemNetworkingPlatform";
import DLLsHelper from "./core/utils/DLLsHelper";
import Logger from "./core/utils/Logger";

/* Class-Method-Parameter Data  */
type CMPData = {
  class : Il2Cpp.Class,
  method: Il2Cpp.Method,
  parameter: Il2Cpp.Parameter
  parameter_position: number 
}

Il2Cpp.perform(() => {
 
  const unityAnalyticsPlatform = new UnityAnalyticsPlatform();

  unityAnalyticsPlatform.handleFunctions();

  /*
  const classFilter = ["web","http","network","request"]
  const methodFilter = ["post","send", "get"]
  const parameterFilter = ["url","uri"]

  const foundClasses : Il2Cpp.Class[] = [];
  

  Il2Cpp.domain.assemblies.forEach((assembly : Il2Cpp.Assembly)=>{
    foundClasses.push(...assembly.image.classes.filter((klass : Il2Cpp.Class) => DLLsHelper.isItIncludesClass(classFilter,klass) ))
  })


  // Filters all methods.
  const foundMethods : CMPData[] = []
  foundClasses.forEach((klass : Il2Cpp.Class)=>{
    klass.methods.forEach((method: Il2Cpp.Method)=>{

      const parameterList = DLLsHelper.isItIncludesParameters(parameterFilter, method.parameters)

      if(parameterList.length > 0 && !method.virtualAddress.isNull() ){

      foundMethods.push(...parameterList.map((param)=>{
       return {
        class: method.class,
        method: method,
        parameter: param,
        parameter_position: param.position
      }
      }))
      }
      return false;
    })
  })

  
  
// Prints all founded method.
/*foundMethods.forEach((methodData)=>{
  console.log("Assembly Name: ", methodData.class.assemblyName);
  console.log("Class Name: ", methodData.class.name);
  console.log("Method Name: ", methodData.method.name);
  console.log("Parameter Name: ", methodData.parameter.name);
  console.log("Parameter Position: ", methodData.parameter_position);
  console.log("=======================================");
  
})*/


// Injecting all founded method.
/*foundMethods.forEach((method : CMPData)=>{
    if((method.method.implementationFlags != 4096) ){
      method.method.implementation = function (...params: Il2Cpp.Parameter.Type[]) {
        params[method.parameter_position] = Il2Cpp.string("https://mock-bdae381a474442bf961d953a4caf67e7.mock.insomnia.rest/pistol");
        return this.method(method.method.name).invoke( ...params);
      }
    }else{
      console.log(`This method cannot changable because it is thunk. (${method.method.name})`);
    }
  
  
})


  



  // const unityAnlyticsPlatform = new UnityAnalyticsPlatform();
// unityAnlyticsPlatform.handleFunctions();
  //const dllS = new DLLs();
  //dllS.handleFunctions();
  //const systemNetwork = new SystemNetwork();
  //systemNetwork.handleFunctions();
  //const unityNetworkingPlatform = new UnityNetworkingPlatform();
  //unityNetworkingPlatform.handleFunctions();
  //const gameMechanics = new GameMechanics();
  //gameMechanics.handleFunctions();
  ///Il2Cpp.trace(true).classes(UnityWebRequest).and().attach();
  */
});
