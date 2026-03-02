/**
 * Helper utility for IL2CPP DLL/Assembly operations.
 * Provides methods for tracing, filtering, and inspecting Unity assemblies,
 * classes, methods, and parameters at runtime.
 * 
 * This class is essential for:
 * - Discovering available assemblies in a VR application
 * - Filtering specific classes/methods for targeted hooking
 * - Tracing execution flow for reverse engineering
 */
export default class DLLsHelper {
  /** Cached list of all loaded IL2CPP assemblies */
  static Assemblies: Il2Cpp.Assembly[] = Il2Cpp.domain.assemblies;

  /**
   * Attaches tracers to ALL loaded assemblies.
   * Warning: This produces verbose output and may impact performance.
   * Use for initial reconnaissance only.
   */
  public static listenAllDlls(): void {
    Il2Cpp.trace(true).assemblies(...Il2Cpp.domain.assemblies).and().attach();
  }

  /**
   * Traces only classes whose names match the provided filters.
   * More targeted than listenAllDlls() for focused analysis.
   * 
   * @param filters - Array of substrings to match against class names (case-insensitive)
   * @example listenFilteredClasses(["webrequest", "network", "http"])
   */
  public static listenFilteredClasses(filters: string[]): void {
    Il2Cpp.trace(true)
    .assemblies(...this.Assemblies)
    .filterClasses((klass) => this.isItIncludesClass(filters, klass))
    .and()
    .attach();
  }

  /**
   * Traces methods that match both class and method name filters.
   * Combines class filtering with method-level filtering for precise targeting.
   * 
   * @param classFilters - Array of substrings to match against class names
   * @param methodFilters - Array of substrings to match against method names
   * @example listenFilteredMethods(["WebRequest"], ["send", "post", "get"])
   */
  public static listenFilteredMethods(classFilters: string[], methodFilters: string[]): void {
    Il2Cpp.trace(true)
    .assemblies(...this.Assemblies)
    .filterClasses((klass) => this.isItIncludesClass(classFilters, klass))
    .filterMethods((method) => {
      if (this.isItIncludesMethod(methodFilters, method)) {
        return true;
      }
      return false;
    })
    .and()
    .attach();
  }

  /**
   * Traces methods based on class and parameter name filters.
   * Useful for finding methods that accept specific types of data.
   * 
   * @param classFilters - Array of substrings to match against class names
   * @param parameterFilters - Array of substrings to match against parameter names
   */
  public static listenFilteredParameters(classFilters: string[], parameterFilters: string[]): void {
    Il2Cpp.trace(true)
    .assemblies(...this.Assemblies)
    .filterClasses((klass) => this.isItIncludesClass(classFilters, klass))
    .filterParameters((parameter) => this.isItIncludesParameter(parameterFilters, parameter))
    .and()
    .attach();
  }

  /**
   * Checks if a class name matches any of the provided filter strings.
   * @param filters - Filter substrings to match (case-insensitive)
   * @param klass - IL2CPP class to check
   * @returns true if the class name contains any filter string
   */
  public static isItIncludesClass(filters: string[], klass: Il2Cpp.Class): boolean {
    if (filters.some(filter => klass.name.toLowerCase().includes(filter))) {
      return true;
    }
    return false;
  }

  /**
   * Checks if a method name matches any of the provided filter strings.
   * @param filters - Filter substrings to match (case-insensitive)
   * @param method - IL2CPP method to check
   * @returns true if the method name contains any filter string
   */
  public static isItIncludesMethod(filters: string[], method: Il2Cpp.Method): boolean {
    if (filters.some(filter => method.name.toLowerCase().includes(filter))) {
      return true;
    }
    return false;
  }

  /**
   * Checks if a parameter name matches any of the provided filter strings.
   * @param filters - Filter substrings to match (case-insensitive)
   * @param parameter - IL2CPP parameter to check
   * @returns true if the parameter name contains any filter string
   */
  private static isItIncludesParameter(filters: string[], parameter: Il2Cpp.Parameter): boolean {
    if (filters.some(filter => parameter.name.toLowerCase().includes(filter))) {
      return true;
    }
    return false;
  }

  /**
   * Filters a list of parameters and returns those matching the filter criteria.
   * @param filters - Filter substrings to match against parameter names
   * @param parameters - Array of IL2CPP parameters to filter
   * @returns Array of matching parameters
   */
  public static isItIncludesParameters(filters: string[], parameters: Il2Cpp.Parameter[]): Il2Cpp.Parameter[] {
    let parameterList: Il2Cpp.Parameter[] = [];

    parameters.some(param => filters.some(filter => {
      if (param.name.toLowerCase().includes(filter)) {
        parameterList.push(param);
      }
    }));
    return parameterList;
  }

  /**
   * Returns all loaded IL2CPP assemblies.
   * @returns Array of all assemblies in the application domain
   */
  public static getAssemblies(): Il2Cpp.Assembly[] {
    return this.Assemblies;
  }

  /**
   * Returns all classes from all loaded assemblies.
   * @returns Flattened array of all IL2CPP classes
   */
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