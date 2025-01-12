/**
 * Trims leading and trailing double quotes from a given URI string.
 *
 * @param uri - The URI string to be trimmed.
 * @returns The trimmed URI string without leading and trailing double quotes.
 */
export default function QuateTrimmer(uri: String): String {
  let trimmedUri = String(uri);
  if (trimmedUri.startsWith('"')) {
    trimmedUri = trimmedUri.replace('"', "");
  }
  if (trimmedUri.endsWith('"')) {
    trimmedUri = trimmedUri.replace('"', "");
  }

  return trimmedUri;
}
