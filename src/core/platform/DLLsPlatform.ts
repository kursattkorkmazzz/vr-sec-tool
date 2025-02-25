import IPlatform from "../interfaces/IPlatform";

/**
 * TODO:
 *
 * Otomatik olarak tüm assembly dosyalarındaki filtreleme mekanizmasına göre class ve metodları dinlemeye alıyor.
 *
 * Yapılması Gereken:
 *  - Dinlemeye alınan bu methodlar çağırıldığı anda benim yazdığım fonksiyona class ve method parametre olarak verilmesi gerekiyor.
 *    Böylece içerisindeki payload'a erişebileyim.
 */

export default class DLLs implements IPlatform {
  Assemblies: Il2Cpp.Assembly[];
  constructor() {
    this.Assemblies = Il2Cpp.domain.assemblies;
  }

  handleFunctions(): void {
    //web, http, network
    const classFilters = ["http", "network", "web"];
    const methodFilters = ["post", "set", "send"];
    const parameterFilters = ["url", "uri"];
    //this.listenFilteredClasses(classFilters);
    //this.listenFilteredMethods(classFilters,methodFilters);
    this.listenFilteredParameters(classFilters, parameterFilters);
    return;
  }

  private listenAllDlls(): void {
    Il2Cpp.trace(true)
      .assemblies(...Il2Cpp.domain.assemblies)
      .and()
      .attach();
  }

  // Do more partical and adjustmen
  private listenFilteredClasses(filters: string[]): void {
    Il2Cpp.trace(true)
      .assemblies(...this.Assemblies)
      .filterClasses((klass) => this.isItIncludesClass(filters, klass))
      .and()
      .attach();
  }

  private listenFilteredMethods(
    classFilters: string[],
    methodFilters: string[]
  ): void {
    Il2Cpp.trace(true)
      .assemblies(...this.Assemblies)
      .filterClasses((klass) => this.isItIncludesClass(classFilters, klass))
      .filterMethods((method) => this.isItIncludesMethod(methodFilters, method))
      .and()
      .attach();
  }

  private listenFilteredParameters(
    classFilters: string[],
    parameterFilters: string[]
  ): void {
    Il2Cpp.trace(true)
      .assemblies(...this.Assemblies)
      .filterClasses((klass) => this.isItIncludesClass(classFilters, klass))
      .filterParameters((parameter) =>
        this.isItIncludesParameter(parameterFilters, parameter)
      )
      .and()
      .attach();
  }
  private isItIncludesClass(filters: string[], klass: Il2Cpp.Class): boolean {
    if (filters.some((filter) => klass.name.toLowerCase().includes(filter))) {
      return true;
    }
    return false;
  }

  private isItIncludesMethod(
    filters: string[],
    method: Il2Cpp.Method
  ): boolean {
    if (filters.some((filter) => method.name.toLowerCase().includes(filter))) {
      return true;
    }
    return false;
  }

  private isItIncludesParameter(
    filters: string[],
    parameter: Il2Cpp.Parameter
  ): boolean {
    if (
      filters.some((filter) => parameter.name.toLowerCase().includes(filter))
    ) {
      return true;
    }
    return false;
  }
}
