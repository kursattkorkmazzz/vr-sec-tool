import IAuthorizator from "../interfaces/IAuthorizator";
import whiteList from "../../../whitelist.json";
const URL = require("@frida/url");
export default class WhitelistAuthorizator implements IAuthorizator {
  authorize(param: any[]): boolean {
    let isAuthorized = true;
    // TODO This is not finished yet.
    whiteList.forEach((host) => {
      const listUrl = URL.parse(host.url);
      const targetUri = String(param[0]).replace('"', "");
      console.log("Host Uri: " + host.url);

      console.log("Target Uri: ", targetUri);
      const targetUrl = URL.parse(targetUri);

      //console.log(JSON.stringify(listUrl, null, 3));
      console.log(JSON.stringify(targetUrl, null, 3));
    });
    return isAuthorized;
  }
}
