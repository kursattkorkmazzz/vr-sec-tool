export default function isValidUrl(url?: string | null): boolean {
  try {
    if (url === null || url === undefined) {
      return false;
    }
    const httpsRegex = /https?:\/\/[^\s"']+/i;
    return httpsRegex.test(url);
  } catch (e) {
    return false;
  }
}
