/**
 * UnityWebRequestPlatform - Core Network Interception Module
 * ==========================================================
 *
 * PURPOSE:
 *   Hooks into Unity's UnityWebRequest to intercept and redirect
 *   all HTTP/HTTPS traffic from VR applications to our mock server.
 *
 * HOW IT WORKS (3 steps):
 *   1. Find the UnityWebRequest class inside the running app (IL2CPP)
 *   2. Replace constructor & setter methods with our custom versions
 *   3. Our versions redirect URLs → mock server, and optionally swap payloads
 *
 * HOOKS INSTALLED:
 *   ┌─────────────────────────┬────────────────────────────────────┐
 *   │ Hook Target             │ What It Does                       │
 *   ├─────────────────────────┼────────────────────────────────────┤
 *   │ .ctor(url)              │ Redirects URL to mock server       │
 *   │ .ctor(url, method)      │ Redirects URL to mock server       │
 *   │ .ctor(url, method, ...) │ Redirects URL to mock server       │
 *   │ set_url(url)            │ Forces URL to mock server          │
 *   │ set_uploadHandler(h)    │ Replaces upload payload (optional) │
 *   └─────────────────────────┴────────────────────────────────────┘
 */

import Config from "../config/Config";
import IPlatform from "../interfaces/IPlatform";
import isValidUrl from "../utils/isValidUrl";
import Logger from "../utils/Logger";

export default class UnityWebRequestPlatform implements IPlatform {

  // ──────────────────────────────────────────────
  // MAIN ENTRY POINT
  // ──────────────────────────────────────────────

  handleFunctions(): void {

    // STEP 1 — Locate the UnityWebRequest class in memory
    const assembly = Il2Cpp.domain.tryAssembly("UnityEngine.UnityWebRequestModule");
    if (!assembly) {
      Logger.warn("UnityWebRequestPlatform disabled — assembly not found.");
      return;
    }

    const UnityWebRequest = assembly.image.tryClass(
      "UnityEngine.Networking.UnityWebRequest"
    );
    if (!UnityWebRequest) return;

    const ctor = UnityWebRequest.method(".ctor");
    if (!ctor) return;

    Logger.success("UnityWebRequestPlatform enabled.");

    // STEP 2 — Hook each constructor overload to redirect URLs
    this.hookConstructor_Url(ctor);
    this.hookConstructor_UrlMethod(ctor);
    this.hookConstructor_UrlMethodHandlers(ctor);

    // STEP 3 — Hook setters
    this.hookSetUrl(UnityWebRequest);

    if (Config.CHANGE_DATA) {
      this.hookSetUploadHandler(UnityWebRequest);
      Logger.info("Payload modification activated.");
    }
  }

  // ──────────────────────────────────────────────
  // CONSTRUCTOR HOOKS  (redirect URL → mock server)
  // ──────────────────────────────────────────────

  /**
   * Hook: new UnityWebRequest(url)
   * If URL is valid HTTP(S), redirect to mock server.
   */
  private hookConstructor_Url(ctor: Il2Cpp.Method): void {
    const overload = ctor.tryOverload("System.String");
    if (!overload) return;

    overload.implementation = function (this, ...params: Il2Cpp.Parameter.Type[]) {
      const url = params[0] as Il2Cpp.String;

      // Only redirect valid HTTP/HTTPS URLs
      const shouldRedirect = isValidUrl(url.content) && Config.JUST_LISTEN;

      const targetUrl = shouldRedirect
        ? Il2Cpp.string(Config.MOCKUP_SERVER)  // → redirect to our server
        : params[0];                            // → keep original URL

      return this.method(".ctor").overload("System.String").invoke(targetUrl);
    };

    Logger.success("Hooked .ctor(String)");
  }

  /**
   * Hook: new UnityWebRequest(url, httpMethod)
   * Always redirects URL to mock server, keeps HTTP method unchanged.
   */
  private hookConstructor_UrlMethod(ctor: Il2Cpp.Method): void {
    const overload = ctor.tryOverload("System.String", "System.String");
    if (!overload) return;

    overload.implementation = function (this, ...params: Il2Cpp.Parameter.Type[]) {
      const mockUrl = Il2Cpp.string(Config.MOCKUP_SERVER);
      const httpMethod = params[1]; // GET, POST, etc. — unchanged

      return this.method(".ctor")
        .overload("System.String", "System.String")
        .invoke(mockUrl, httpMethod);
    };

    Logger.success("Hooked .ctor(String, String)");
  }

  /**
   * Hook: new UnityWebRequest(url, method, downloadHandler, uploadHandler)
   * Redirects URL, passes handlers through unchanged.
   */
  private hookConstructor_UrlMethodHandlers(ctor: Il2Cpp.Method): void {
    const DownloadHandler = Il2Cpp.domain
      .assembly("UnityEngine.UnityWebRequestModule")
      .image.class("UnityEngine.Networking.DownloadHandler");
    const UploadHandler = Il2Cpp.domain
      .assembly("UnityEngine.UnityWebRequestModule")
      .image.class("UnityEngine.Networking.UploadHandler");

    const overload = ctor.tryOverload(
      "System.String", "System.String",
      DownloadHandler.fullName, UploadHandler.fullName
    );
    if (!overload) return;

    overload.implementation = function (this, ...params: Il2Cpp.Parameter.Type[]) {
      const mockUrl = Il2Cpp.string(Config.MOCKUP_SERVER);

      return this.method(".ctor")
        .overload("System.String", "System.String", DownloadHandler.fullName, UploadHandler.fullName)
        .invoke(mockUrl, params[1], params[2], params[3]);
    };

    Logger.success("Hooked .ctor(String, String, DownloadHandler, UploadHandler)");
  }

  // ──────────────────────────────────────────────
  // SETTER HOOKS
  // ──────────────────────────────────────────────

  /**
   * Hook: request.url = "..."
   * Forces every URL assignment to point to mock server.
   */
  private hookSetUrl(cls: Il2Cpp.Class): void {
    const method = cls.tryMethod("set_url");
    if (!method) {
      Logger.error("set_url not found.");
      return;
    }

    method.implementation = function (this) {
      const mockUrl = Il2Cpp.string(Config.MOCKUP_SERVER);
      return this.method("set_url").invoke(mockUrl);
    };

    Logger.success("Hooked set_url");
  }

  /**
   * Hook: request.uploadHandler = handler
   * Replaces the upload payload with a custom JSON body:
   *   { "AYBU": "VR SECTEAM" }
   *
   * This demonstrates that outgoing data can be fully controlled.
   */
  private hookSetUploadHandler(cls: Il2Cpp.Class): void {
    const method = cls.tryMethod("set_uploadHandler");
    if (!method) {
      Logger.error("set_uploadHandler not found.");
      return;
    }

    method.implementation = function (this) {
      // Build custom JSON payload as byte array:  { "AYBU": "VR SECTEAM" }
      const jsonBytes = [
        123, 10, 34, 65, 89, 66, 85, 34, 58, 34, 86, 82, 32,
        83, 69, 67, 84, 69, 65, 77, 34, 10, 125
      ];

      const payload = Il2Cpp.array<number>(
        Il2Cpp.corlib.class("System.Byte"),
        jsonBytes
      );

      // Create a new UploadHandlerRaw with our payload
      const rawHandlerClass = Il2Cpp.domain
        .assembly("UnityEngine.UnityWebRequestModule")
        .image.class("UnityEngine.Networking.UploadHandlerRaw");

      const handler = rawHandlerClass.alloc();
      const handlerCtor = handler.tryMethod(".ctor");
      if (!handlerCtor) {
        Logger.error("UploadHandlerRaw constructor not found.");
        return;
      }
      handlerCtor.invoke(payload);

      Logger.info("Injected custom upload payload.");

      // Replace original handler with ours
      return this.method("set_uploadHandler").invoke(handler as Il2Cpp.Parameter.Type);
    };
  }
}
