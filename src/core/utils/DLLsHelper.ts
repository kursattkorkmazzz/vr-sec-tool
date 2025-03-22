import IPlatform from "../interfaces/IPlatform";

export default class DLLsHelper {
  static Assemblies: Il2Cpp.Assembly[] = Il2Cpp.domain.assemblies;

  public static listenAllDlls(): void {
    Il2Cpp.trace(true).assemblies(...Il2Cpp.domain.assemblies).and().attach();
  }

  // Do more partical and adjustmen
  public static listenFilteredClasses(filters: string[]): void {
    Il2Cpp.trace(true)
    .assemblies(...this.Assemblies)
    .filterClasses((klass) => this.isItIncludesClass(filters, klass))
    .and()
    .attach();
  }

  public static listenFilteredMethods(classFilters:string[],methodFilters: string[]): void {


    Il2Cpp.trace(true)
    .assemblies(...this.Assemblies)
    .filterClasses((klass) => this.isItIncludesClass(classFilters, klass))
    .filterMethods((method) => {
      if(this.isItIncludesMethod(methodFilters, method)){
        return true
      }
      return false
    })
    .and()
    .attach();
  }

  public static listenFilteredParameters(classFilters: string[],parameterFilters: string[]): void {
    Il2Cpp.trace(true)
    .assemblies(...this.Assemblies)
    .filterClasses((klass) => this.isItIncludesClass(classFilters, klass))
    .filterParameters((parameter) => this.isItIncludesParameter(parameterFilters, parameter))
    .and()
    .attach();
  }
  public static isItIncludesClass(filters: string[], klass: Il2Cpp.Class): boolean {
    if(filters.some(filter => klass.name.toLowerCase().includes(filter))) {
      return true;
    }
    return false;
  }

  public static isItIncludesMethod(filters: string[], method: Il2Cpp.Method): boolean {
    if(filters.some(filter => method.name.toLowerCase().includes(filter))) {
      return true;
    }
    return false;
  }

  private static isItIncludesParameter(filters: string[], parameter: Il2Cpp.Parameter): boolean {
    if(filters.some(filter => parameter.name.toLowerCase().includes(filter))) {
      return true;
    }
    return false;
  }

  public static isItIncludesParameters(filters: string[], parameters: Il2Cpp.Parameter[]): Il2Cpp.Parameter[]{
    let parameterList : Il2Cpp.Parameter[] = []

    parameters.some(param => filters.some(filter => {
      if(param.name.toLowerCase().includes(filter)){
       parameterList.push(param);
      }
    }));
    return parameterList
  }

  public static getAssemblies(): Il2Cpp.Assembly[] {
    return this.Assemblies;
  }

  public static getClasses(): Il2Cpp.Class[] {
    return this.Assemblies.flatMap(assembly => assembly.image.classes);
  }


  public static getMethods(): Il2Cpp.Method[] {
    return this.Assemblies.flatMap(assembly => assembly.image.classes.flatMap(klass => klass.methods));
  }
  
   public static getMethodsByFiltering(parameterFilter:string, classFilter:string): Il2Cpp.Method[] {
    
    return this.Assemblies.flatMap(assembly => assembly.image.classes.flatMap(klass => klass.methods));
  }
}