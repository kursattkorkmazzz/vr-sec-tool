import IAuthorizator from "../interfaces/IAuthorizator";
import whiteList from "../../../whitelist.json";
import QuateTrimmer from "../utils/QuateTrimmer";
const URL = require("@frida/url");

export default class WhitelistAuthorizator implements IAuthorizator {
  /**
   * Authorizes a given URI by checking it against a whitelist of hosts.
   *
   * @param uri - The URI to be authorized.
   * @returns A boolean indicating whether the URI is authorized.
   */
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
