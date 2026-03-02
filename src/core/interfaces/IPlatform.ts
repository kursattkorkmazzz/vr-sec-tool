/**
 * Interface for platform-specific instrumentation handlers.
 * Each platform implementation targets a specific Unity module
 * (e.g., UnityWebRequest, Unity Analytics) for network interception.
 * 
 * Implementations should:
 * 1. Locate the target assembly and class
 * 2. Hook relevant methods (constructors, setters, etc.)
 * 3. Implement interception logic (logging, redirection, modification)
 */
export default interface IPlatform {
  /**
   * Initializes and attaches hooks to the target platform's methods.
   * This method should be called once during script initialization.
   * 
   * Expected behavior:
   * - Locate target IL2CPP assembly
   * - Find relevant classes and methods
   * - Attach implementation hooks for interception
   * - Log success/failure status
   */
  handleFunctions(): void;
}
