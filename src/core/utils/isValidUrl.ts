/**
 * Validates whether a given string is a valid HTTP/HTTPS URL.
 * Used to filter and identify network request destinations.
 * 
 * @param url - The URL string to validate (can be null or undefined)
 * @returns true if the string is a valid HTTP/HTTPS URL, false otherwise
 * 
 * @example
 * isValidUrl("https://example.com")  // returns true
 * isValidUrl("http://api.server.com/path")  // returns true
 * isValidUrl("not-a-url")  // returns false
 * isValidUrl(null)  // returns false
 */
export default function isValidUrl(url?: string | null): boolean {
  try {
    if (url === null || url === undefined) {
      return false;
    }
    // Regex pattern matches http:// or https:// followed by non-whitespace characters
    const httpsRegex = /https?:\/\/[^\s"']+/i;
    return httpsRegex.test(url);
  } catch (e) {
    return false;
  }
}
