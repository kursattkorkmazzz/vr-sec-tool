type Categories = "Debug" | "Unity Networking";

export default class Logger {
  static category: Categories = "Debug";

  static setCategory(category: Categories): Logger {
    this.category = category;
    return this;
  }

  static error(...data: any[]) {
    console.error(
      "\x1b[31m [" + String(this.category) + "] " + data + "\x1b[0m"
    );
  }
  static log(...data: any[]) {
    console.log(" [" + String(this.category) + "] " + data);
  }

  static info(...data: any[]) {
    console.info(
      "\x1b[34m [" + String(this.category) + "] " + data + "\x1b[0m"
    );
  }

  static warn(...data: any[]) {
    console.warn(
      "\x1b[33m [" + String(this.category) + "] " + data + "\x1b[0m"
    );
  }
  static success(...data: any[]) {
    console.log("\x1b[32m [" + String(this.category) + "] " + data + "\x1b[0m");
  }
  static logMethodInfo(method: Il2Cpp.Method) {
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
