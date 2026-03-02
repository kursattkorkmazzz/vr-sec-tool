/**
 * Log categories for filtering and organizing output.
 */
type Categories = "Debug" | "Unity Networking";

/**
 * Centralized logging utility with colored console output.
 * Provides consistent formatting and categorization for debug messages.
 * 
 * Color coding:
 * - Red: Errors
 * - Yellow: Warnings  
 * - Blue: Info messages
 * - Green: Success messages
 * - Default: Standard log messages
 */
export default class Logger {
  /** Current logging category displayed in output prefix */
  static category: Categories = "Debug";

  /**
   * Sets the current logging category.
   * @param category - The category name to display in log prefix
   * @returns Logger instance for method chaining
   */
  static setCategory(category: Categories): Logger {
    this.category = category;
    return this;
  }

  /**
   * Logs an error message in red color.
   * @param data - Data to log
   */
  static error(...data: any[]): void {
    console.error(
      "\x1b[31m [" + String(this.category) + "] " + data + "\x1b[0m"
    );
  }

  /**
   * Logs a standard message without color.
   * @param data - Data to log
   */
  static log(...data: any[]): void {
    console.log(" [" + String(this.category) + "] " + data);
  }

  /**
   * Logs an informational message in blue color.
   * @param data - Data to log
   */
  static info(...data: any[]): void {
    console.info(
      "\x1b[34m [" + String(this.category) + "] " + data + "\x1b[0m"
    );
  }

  /**
   * Logs a warning message in yellow color.
   * @param data - Data to log
   */
  static warn(...data: any[]): void {
    console.warn(
      "\x1b[33m [" + String(this.category) + "] " + data + "\x1b[0m"
    );
  }

  /**
   * Logs a success message in green color.
   * @param data - Data to log
   */
  static success(...data: any[]): void {
    console.log("\x1b[32m [" + String(this.category) + "] " + data + "\x1b[0m");
  }

  /**
   * Logs detailed information about an IL2CPP method.
   * Useful for debugging and understanding hooked method signatures.
   * 
   * @param method - The IL2CPP method to inspect
   */
  static logMethodInfo(method: Il2Cpp.Method): void {
    this.info("=====================");
    this.info("Method Name: " + method.name);
    this.info("Static Method: " + method.isStatic);
    this.info("Generic Method: " + method.isGeneric);
    this.info("External Method: " + method.isExternal);
    this.info("Parameter Count: " + method.parameterCount);
    this.info("is Null: " + method.isNull);
    this.info("Flags: " + method.flags);
    this.info(
      "Parameters: " +
        method.parameters.map((p) => `${p.position}. ${p.name}`).join(", ")
    );
    this.info("Return Type: " + method.returnType);
    this.info("=====================");
  }
}
