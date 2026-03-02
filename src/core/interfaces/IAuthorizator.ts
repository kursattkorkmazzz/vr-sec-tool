/**
 * Interface for authorization handlers.
 * Implementations determine whether specific data transmissions
 * should be allowed based on policy rules.
 * 
 * Used for permission-aware filtering of network requests.
 */
export default interface IAuthorizator {
  /**
   * Evaluates whether a data transmission should be authorized.
   * 
   * @param param - Variable parameters representing request context
   *                (e.g., URL, payload, headers, permissions)
   * @returns true if the transmission is allowed, false to block/sanitize
   */
  authorize(...param: any): boolean;
}
