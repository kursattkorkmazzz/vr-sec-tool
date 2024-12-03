/**
 * Reads the payload from the upload handler of a UnityWebRequest object.
 *
 * @param {Il2Cpp.Object} unityWebRequest - The UnityWebRequest object from which to read the upload handler payload.
 * @returns {String | null} The payload data as a string, or null if the provided object is not a UnityWebRequest.
 */
export default function UploadHandlerPayloadReader(
  unityWebRequest: Il2Cpp.Object
): String | null {
  if (!unityWebRequest.toString().includes("UnityWebRequest")) {
    return null;
  }

  const uploadHandlerMethod = unityWebRequest.method("get_uploadHandler"); //
  const uploadHandlerRaw = uploadHandlerMethod.invoke() as Il2Cpp.Object;
  const payload = uploadHandlerRaw.field("m_Payload");
  const payload_pointer = (payload.value as Il2Cpp.ValueType).box();

  const itemLength = payload_pointer.method("get_Length").invoke() as number;
  const getItemMethod = payload_pointer.method("get_Item");

  let payloadData: string = "";
  for (let i = 0; i < itemLength; i++) {
    payloadData += String.fromCharCode(getItemMethod.invoke(i) as number);
  }
  return payloadData;
}
