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
}
