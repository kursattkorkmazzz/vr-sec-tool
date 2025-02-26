import { get } from "http";
import IPlatform from "../interfaces/IPlatform";
import Logger from "../utils/Logger";
import { log } from "console";
import UploadHandlerPayloadReader from "../utils/UploadHandlerPayloadReader";
import UriPayloadReader from "../utils/UriPayloadReader";

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

  classFilters = ["http", "network", "web"];
  methodFilters = ["sent", "post", "get", "upload"];
  parameterFilters = ["uri", "url"];

  constructor() {
    this.Assemblies = Il2Cpp.domain.assemblies;
  }

  handleFunctions(): void {
    //web, http, network

    // this.listenFilteredClasses(classFilters);
    this.listenFilteredMethods(this.classFilters, this.methodFilters);
    //this.listenFilteredParameters(classFilters, parameterFilters);
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
    const filteredClasses: Il2Cpp.Class[] = [];

    Il2Cpp.trace(true)
      .assemblies(...this.Assemblies)
      .filterClasses((klass) => this.isItIncludesClass(classFilters, klass))
      .filterMethods((method) => {
        if (this.isItIncludesMethod(methodFilters, method)) {
          if (method.virtualAddress.toInt32() != 0) {
            Interceptor.attach(method.virtualAddress, {
              onEnter(args) {
                const instance = new Il2Cpp.Object(args[0]);

                const postPayload = UploadHandlerPayloadReader(instance);
                const getPayload = UriPayloadReader(instance);

                console.log(instance.field("m_Uri", true).value);

                if (postPayload != "") {
                  Logger.log("POST Payload: " + postPayload);
                }

                if (getPayload != "") {
                  Logger.log("GET Payload: " + getPayload);
                }
              },
            });
          }

          return true;
        }
        return false;
      })
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
    if (
      filters.some((filter) =>
        klass.name.toLowerCase().includes(filter.toLowerCase())
      )
    ) {
      return true;
    }
    return false;
  }

  private isItIncludesMethod(
    filters: string[],
    method: Il2Cpp.Method
  ): boolean {
    if (
      filters.some((filter) =>
        method.name.toLowerCase().includes(filter.toLowerCase())
      )
    ) {
      return true;
    }
    return false;
  }

  private isItIncludesParameter(
    filters: string[],
    parameter: Il2Cpp.Parameter
  ): boolean {
    if (
      filters.some((filter) =>
        parameter.name.toLowerCase().includes(filter.toLowerCase())
      )
    ) {
      return true;
    }
    return false;
  }
}
