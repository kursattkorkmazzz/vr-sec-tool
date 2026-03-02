/**
 * Configuration settings for Silent Shield instrumentation framework.
 * Modify these values to control the behavior of network interception.
 */
const Config = {
  /**
   * When true, replaces outgoing payloads with dummy/sanitized data.
   * Use this to test payload manipulation without affecting app functionality.
   * @default false
   */
  CHANGE_DATA: false,

  /**
   * URL of the mock server to redirect intercepted network requests.
   * All captured traffic will be sent here for analysis when redirection is enabled.
   * @default Postman mock server URL
   */
  MOCKUP_SERVER: "https://032e9444-1195-46f2-8760-7fc085bac5db.mock.pstmn.io",

  /**
   * Operation mode toggle:
   * - true: Passive mode - only traces/logs network calls without modification
   * - false: Active mode - hooks constructors and methods to intercept/redirect traffic
   * @default true
   */
  JUST_LISTEN: true,

  /**
   * When true, logs performance metrics such as injection timing.
   * Useful for measuring framework overhead.
   * @default false
   */
  TELEMETRY: false,
};

export default Config;
