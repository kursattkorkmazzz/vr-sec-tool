import IAuthorizator from "../interfaces/IAuthorizator";
import whiteList from "../../../whitelist.json";
import QuateTrimmer from "../utils/QuateTrimmer";
const URL = require("@frida/url");

export default class WhitelistAuthorizator implements IAuthorizator {
  authorize(uri: String): boolean {
    let isAuthorized = false;
    const targetUri = String(QuateTrimmer(uri));
    const targetURL = URL.parse(targetUri);
    whiteList.forEach((host) => {
      const hostURL = URL.parse(host.url);
      if (hostURL.host === targetURL.host && host.status) {
        isAuthorized = true;
      }
    });
    return isAuthorized;
  }
}
