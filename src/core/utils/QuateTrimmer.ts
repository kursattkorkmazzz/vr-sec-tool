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
