# Silent Shield: Dynamic Instrumentation of Privacy Breaches in Oculus VR Applications 

Fadi Yilmaz ${ }^{1,2}{ }^{\text {(B) }}$, Bilge Kelesoglu ${ }^{1}$ (D) ${ }^{\text {b }}$, Kursat Korkmaz ${ }^{1}$ (B) , Beyza Karakurt ${ }^{1}$ (B) , Gurkan Agir ${ }^{1}$ (B)<br>${ }^{1}$ Department of Computer Engineering, Ankara Yildirim Beyazit University, Ankara, Türkiye<br>${ }^{2}$ Department of Computer Science and Engineering, Qatar University, Doha, Qatar<br>fadiyilmaz@aybu.edu.tr, kelesoglu.bilge@gmail.com, kursatkorkmaz5225@gmail.com,karakurttbeyza@gmail.com, agirgurkan.business@gmail.com

Keywords: Runtime reference monitoring, Virtual Reality security, Privacy preservation, Dynamic instrumentation


#### Abstract

Rising Virtual Reality (VR) adoption necessitates urgent scrutiny of application privacy, yet existing analysis tools often fail to capture Unity-based data flows that are abstracted from the standard Android stack. We present Silent Shield, a lightweight, fully automated dynamic instrumentation framework targeting UnityWebRequest to intercept and control sensitive traffic in Oculus VR applications. Our approach requires neither source code nor root privileges. Leveraging IL2CppDumper, dnSpy, and Frida, we dynamically hook networking methods to inspect and modify outbound traffic in real-time. Evaluation across fourteen Meta Quest applications demonstrates effective interception with minimal overhead (less than 30 ms ), confirming the framework's viability for privacy enforcement in the Unity-dominated VR ecosystem.


## 1 INTRODUCTION

Virtual Reality (VR) has evolved from a niche innovation into a multi-billion dollar market, with devices like Meta Quest driving mainstream adoption (Fortune Business Insights, 2024; Soundarya Jayaraman, 2024). However, this rapid growth introduces severe privacy and security risks; VR devices capture continuous streams of biometric data-ranging from head orientation to subtle facial dynamics-capable of uniquely identifying users (Cong et al., 2021). Recent audits reveal that nearly $70 \%$ of VR data flows are undisclosed in privacy policies, often leaking Personally Identifiable Information (PII) and device identifiers to third parties (Trimananda et al., 2022; Yu et al., 2025)

Modern VR platforms (e.g., Meta Quest, Pico) fundamentally rely on the Android ecosystem, inheriting architectural conventions like APK packaging and the AndroidManifest.xml permission model for regulating access to hardware resources (ByteDance Ltd., 2023; Meta Platforms Inc., 2023). While this

[^0]foundation exposes VR apps to traditional mobile security risks, their runtime behavior differs due to the reliance on game engines like Unity and native code (Xu et al., 2021). Unlike standard apps, these immersive environments process continuous biometric and behavioral data that often bypass standard Android monitoring tools. Crucially, we infer that the aggregation of such sensor data with immutable hardware identifiers creates a high-entropy "device fingerprint", enabling persistent user tracking across sessions that typical permission models fail to mitigate.

Relying solely on the protections of the operating system or user discretion is insufficient for robust security. Users frequently grant permissions without scrutiny, especially on Android and in Meta Quest environments, giving applications broad access to sensitive resources. Moreover, operating system-level enforcement lacks fine granularity: it governs whether an application can access data but not how that data is subsequently used. Once access is granted, nothing prevents an application from transmitting sensitive information to unauthorized parties unless those recipients are explicitly blacklisted. These limitations, combined with user negligence, enable malicious or careless applications to bypass operating system controls, underscoring the necessity of additional protection at the application layer.

![](https://cdn.mathpix.com/cropped/b2330641-a9d7-4776-b2ab-d4d09beba106-2.jpg?height=622&width=1486&top_left_y=317&top_left_x=294)
Figure 1: Injection Mechanism. (a) Collecting .apk Files of VR Apps: Selected applications were downloaded to a Meta Quest 2 device from the Oculus and SideQuest (SideQuest Ltd., 2025) app stores. Subsequently, the APK files of these applications were extracted to a computer using a sideloader. (b) Finding the Network Request Functions: The extracted APK files were first processed using a tool called Il2CppDumper (Perfare, 2018). This tool outputs a folder named DummyDll, which contains the .dll files utilized by the application. Among these, the file Assembly-CSharp.dll includes the networkrelated functions used by the application. When this file is loaded into dnSpy (dnSpy Team, 2025), it reveals the C\# code for the application's network module, named UnityWebRequest. This module contains the functions responsible for handling GET and POST requests. (c) Injecting Safeguards Into UnityWebRequest to Prevent Personal Data Transmission: A script was developed to intercept every GET and POST request made by the application. This script was injected into the application's APK file using the Frida Gadget tool. The script implements two types of blocking mechanisms: the first replaces the destination address with a mock-up server, and the second clears or replaces the data in the outgoing payload with empty or dummy information.

To address these limitations, we propose Silent Shield, a dynamic instrumentation framework that targets the UnityWebRequest API to detect and block unauthorized data flows in real-time. Figure 1, illustrates the end-to-end workflow of our dynamic interception and payload manipulation system for Unitybased Meta Quest applications. Unlike static analysis or permission-based systems, our method hooks into the application layer, enabling granular interception of encrypted traffic (via HTTPs) without requiring root privileges or source code. We make the following key contributions: We design and implement a lightweight, fully automated dynamic instrumentation framework for Unity-based Oculus VR applications that operates without developer collaboration.

- We identify UnityWebRequest as a privileged vantage point to regulate sensitive data flows often missed by conventional Android tools.
- We demonstrate effective detection of privacy violations across fourteen popular apps with minimal overhead (less than 30 ms ), confirming the framework's viability for the Unity-dominated VR ecosystem.
- We release our tool as an open-source framework on GitHub, enabling reproducibility, extension, and community adoption

The remainder of this paper is organized as follows. In Section 2, we review related works in the field. Section 3 provides the necessary foundational concepts. In Section 4, we describe our proposed methodology in detail. Section 5 presents the performance analysis and evaluation results. We then discuss the implications of our findings in Section ??. Section 7 outlines potential directions for future research. Finally, Section 8 concludes the paper.

Artifacts. We make our open source implementation and analysis artifacts available at https://github.com/AybuVRSEC/vr-sec-tool.

## 2 RELATED WORKS

This section reviews prior work on security mechanisms in VR ecosystem and their inherent limitations, followed by an overview of studies that define the VR attack surface and characterize potential adversary capabilities.

VR Security Mechanisms and Limitations: Recent efforts to secure VR ecosystems have focused on network auditing and static analysis. OVRSeen (Trimananda et al., 2022) pioneered the analysis of

VR network traffic, revealing widespread undisclosed data flows. However, relying solely on network sniffing faces challenges with encrypted traffic, often necessitating complex man-in-the-middle setups. Similarly, VR-SP (Guo et al., 2024) introduced static analysis to detect privacy leaks in VR binaries. While effective for code inspection, static approaches fundamentally lack visibility into runtime behaviors and obfuscated logic common in game engines. Unlike these approaches, our framework utilizes dynamic instrumentation to intercept data at the API level (UnityWebRequest) before encryption, bridging the gap between network visibility and runtime context.

Incompatibility of Android Dynamic Analysis: While dynamic analysis is mature for standard Android apps (with tools like Heapster (Benz et al., 2020) and T-Recs (Inayoshi et al., 2023)), these are ineffective for Unity-based VR applications. Standard Android tools target the Dalvik/ART virtual machine. In contrast, Unity apps use the IL2CPP (Intermediate Language to C++) backend to compile C\# into native binaries, stripping the metadata required by traditional instrumentation (Unity Technologies, 2025). Ahmed et al.'s ViaLin (Ahmed et al., 2021) further improved dynamic taint tracking by making propagation paths fully observable, allowing analysts to trace how sensitive data moves through the app. Our work addresses this architectural divergence by directly instrumenting the Unity runtime.

Defining the VR Attack Surface. The rich sensory input of VR introduces novel attack vectors. Studies demonstrate that motion data can be exploited for keystroke inference (Slocum et al., 2023), user identification via biometric fingerprinting (Nair et al., 2023), and even eavesdropping on live speech through facial dynamics (Cong et al., 2021). Furthermore, side-channel attacks can infer vital signs (Zhang et al., 2023) or hijack user perception (Yang et al., 2024). Cheng et al. (Cheng et al., 2024) focus on the UI layer of immersive environments, highlighting novel attack surfaces unique to AR/VR platforms. These findings underscore the necessity for granular, real-time monitoring of sensor data flows.

## 3 BACKGROUND

VR applications developed for platforms like Oculus often rely on the Unity game engine, which introduces a unique software architecture that blends managed code with native binaries compiled for Android. Understanding this layered structure is critical for assess-
ing how these applications handle data, interact with external servers, and enforce security boundaries.

![](https://cdn.mathpix.com/cropped/b2330641-a9d7-4776-b2ab-d4d09beba106-3.jpg?height=675&width=689&top_left_y=443&top_left_x=1105)
Figure 2: A Typical VR App File System

### 3.1 Unity-Based VR App Architecture

Unity is a cross-platform game engine widely adopted for VR development due to its rich asset pipeline, scripting flexibility, and support for 3D environments. At the heart of Unity-based applications lies a collection .dll (Dynamic Link Library) files such as Assembly-CSharp.dll. These files encapsulate core gameplay logic, user interaction code, and eventdriven behavior. Unlike typical Android apps, which rely primarily on Java or Kotlin, Unity apps bundle these managed assemblies inside the application package, offering a separate vector for code analysis and behavioral understanding. Figure 2 illustrates the internal file structure of a typical VR application package after decompilation. Understanding this structure is essential for conducting static and dynamic analysis, as it exposes key assets, native libraries, and configuration files relevant to security evaluation.

The compiled application bundles native libraries alongside resource assets, stripping away the standard .NET metadata required for traditional decompilation. Consequently, analyzing these applications necessitates reconstructing the original class structures by correlating the native binary with the globalmetadata.dat file located in the assets directory. This architectural obfuscation renders standard Android static analysis tools ineffective and requires specialized reverse engineering workflows.

### 3.2 Networking in Unity Applications

Network interactions in Unity are primarily managed through the UnityWebRequest API, a modular system for handling HTTP transactions. Although VR applications typically transmit data over HTTPs, UnityWebRequest processes the data payload and headers before the TLS/SSL handshake occurs. This characteristic makes the API a critical abstraction layer for security analysis; by instrumenting this specific interface, it is possible to inspect sensitive data flows (e.g., telemetry, authentication tokens) in plaintext, effectively bypassing transport layer encryption without requiring complex network-level decryption setups.

## 4 STUDY DESIGN AND IMPLEMENTATION

To systematically analyze the privacy and security behaviors of Oculus VR applications, we devised a multi-stage methodology combining static and dynamic techniques. Our approach begins with the collection and unpacking of Unity-based VR apps, followed by a hybrid reverse engineering process that targets both managed and native code components. Using tools such as IL2CppDumper (Perfare, 2018) and dnSpy, we extract structural and functional insights from compiled binaries, with particular attention to networking-related invocations like UnityWebRequest. To complement our static analysis, we employ Frida (Ravnås, 2025) for dynamic instrumentation, enabling real-time monitoring and control over network activities. This layered methodology allows us to detect potential privacy violations and enforce security policy checks during runtime.

### 4.1 VR App Collection

In this study, we curated a set of fourteen Oculus VR applications for in-depth analysis. To ensure efficient experimentation and manageable resource usage, we prioritized applications with relatively small file sizes. This choice facilitates faster installation, reduces storage demands, and minimizes computational overhead during both static and dynamic analysis.

Beyond file size, we also considered other relevant factors to guide our selection. Specifically, we included applications that are popular on official VR storefronts, as indicated by download counts and user reviews. Additionally, we gave preference to applications that had been flagged as privacy-sensitive or
potentially dangerous in prior academic studies or security reports. By incorporating both popularity and historical risk markers into our selection process, we aimed to focus on applications that are both widely used and potentially impactful from a privacy and security standpoint.

Details of the selected applications-identified by name under the "App Name" column-and the types of data they share are summarized in Table 2.

To enable the installation of applications not available through the official Oculus Quest platform, the Oculus Store, we employed the technique of sideloading. Sideloading refers to the process of directly installing APK files onto the device, bypassing standard distribution channels. This method is commonly used by developers and advanced users to deploy, test, or modify custom applications and content outside the constraints of the official ecosystem. Additionally, sideloading often enables extended functionalities such as application management, mod installation, and backup capabilities, thereby enhancing the flexibility and usability of VR devices in development and testing environments.

### 4.2 Locating Network Calls in Decompiled Code

After unpacking the VR application packages, we observed that all analyzed applications were compiled using Unity's IL2CPP backend. As a result, the original Assembly-CSharp.dll file was not directly available in intermediate language (IL) form.

To recover analyzable code, we used IL2CPPDumper (Perfare, 2018) along with the extracted libil2cpp.so binary and global-metadata.dat file. This process allowed us to reconstruct method signatures and generate a pseudo Assembly-CSharp.dll, which we then decompiled using dnSpy (dnSpy Team, 2025) to approximate the original C\# code.

Through this workflow, we statically located key methods responsible for initiating outbound network requests-such as UnityWebRequest. Get and UnityWebRequest.Post. These findings informed the precise targets for dynamic instrumentation in the next phase of our analysis.

### 4.3 Runtime Network Inspection via Frida Instrumentation

While static analysis enabled us to locate potential network communication endpoints, it did not reveal the actual runtime behavior of these functions. To
overcome this limitation and achieve real-time visibility into data flows, we employed Frida (Ravnås, 2025), a dynamic instrumentation toolkit capable of injecting runtime hooks into Android processes.

We embedded Frida into the VR application processes via the Frida Gadget shared library and deployed custom JavaScript-based hooks targeting the UnityWebRequest.Get and UnityWebRequest.Post methods. These hooks captured and logged the parameters of network requests at runtime, including destination URLs, headers, and payload contents, without requiring source code access or app recompilation.

This instrumentation enabled us to identify the transmission of a wide range of sensitive data-such as user identifiers, hardware attributes, session information, locale, SDK version, and authentication tokens-to external servers. Many of these fields are classified as risky personally identifiable information (PII) or device-level metadata, as highlighted in OVRSeen (Trimananda et al., 2022), due to their potential to enable user tracking across sessions or applications. The presence of such data in outbound communications raises significant privacy concerns in immersive VR environments.

By integrating Frida into our analysis pipeline, we gained granular observability into network interactions—even within obfuscated or sandboxed Unity applications-laying the foundation for subsequent enforcement of runtime privacy controls.

Table 1 presents a sample of detected data transmissions from the Pistol Whip application. Entries highlighted in red denote potentially sensitive information that may contribute to user fingerprinting or cross-application tracking. These include unique identifiers such as userID, sessionID, and userLocale, as well as device-specific attributes like cpuType, gpuType, and osVersion. When combined, such data points can form a distinctive fingerprint of a user's device or behavior, allowing third parties to persistently track users across different VR sessions or even across multiple applications.

### 4.4 Manipulating and Filtering Network Payloads

Building on our runtime inspection capabilities, we extended the instrumentation to not only observe, but also manipulate and filter network requests. This allowed us to assess the feasibility of enforcing privacy policies dynamically within Unity-based VR applications.

Given the multiple overloaded constructors in the UnityWebRequest class, we implemented hooks for
each variant, using parameter signatures to reliably intercept all relevant calls. These hooks enabled programmatic redirection of outgoing HTTP requests to a controlled mock server for centralized logging and dynamic payload inspection.

In addition to redirection, we modified outgoing payloads in real-time, for example, by masking authentication tokens or stripping device identifiers from request bodies, without modifying the original application binaries. To inform these runtime decisions, we analyzed the application's declared permissions via static inspection of the AndroidManifest.xml file. This included permissions for accessing sensitive resources such as location, camera, microphone, and device identifiers.

We then compared the transmitted data with

Table 1: Detected Leaked Data Types and Values in PistolWhip
| Data Type | Value |
| :--- | :--- |
| userID | 1c7ac1b9ace1905e19e5faa70e9ad806 |
| app_version | 1.5.65.209 |
| projectID | 31527b4c-5906-426f-afdc1b40c205fca2 |
| language | en |
| sdkVersion | 4.1.0 |
| sessionID | 5843a173-d08c-4d59-974346e8685cb591 |
| platform | ANDROID |
| cpuType | ARM64 |
| gpuType | Adreno TM 650 |
| cpuCores | 3 |
| ramTotal | 5832 |
| screenWidth | 3664 |
| screenHeight | 1920 |
| screenResolution | 200 |
| osVersion | Android OS 14 / API-34 (UP1A.231005.007.A1/515408400) |
| vr_platform | OCULUS_QUEST_2 |
| gameBundleID | com.cloudheadgames.pistolwhip |
| userLocale | tr_ZZ |


Table 2: Resource Overhead Analysis for VR Applications Before and After Instrumentation
| App Name | Data Leak Detected | CPU Usage (\%) |  | Memory Usage (MB) |  | Injection Time (ms) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
|  |  | Before | After | Before | After |  |
| Pistol Whip | ✓ | 79.7 | 81.6 (+2.38\%) | 2773.44 | 2800.61 (+0.98\%) | 28.2 |
| SUPERHOT | ✓ | 94.3 | 92.5 (-1.91\%) | 2773.44 | 2850.12 (+2.76\%) | 27.1 |
| Agent Simulator |  | 64.3 | 70.2 (+9.17\%) | 964.81 | 1050.30 (+8.85\%) | 25.4 |
| Job Simulator | ✓ | 93.2 | 96.7 (+3.75\%) | 970.70 | 986.17 (+1.59\%) | 26.7 |
| Fruit Ninja |  | 79.97 | 79.2 (-0.96\%) | 1454.92 | 1472.90 (+1.24\%) | 22.9 |
| Angry Birds |  | 48.2 | 52.5 (+8.91\%) | 2125.94 | 2252.00 (+5.93\%) | 29.3 |
| I Am Security |  | 88.6 | 95.0 (+7.23\%) | 551.99 | 594.75 (+7.75\%) | 28.7 |
| Walk The Plank VR |  | 54.7 | 53.9 (-1.46\%) | 1379.45 | 1389.20 (+0.71\%) | 24.1 |
| Synth Riders | ✓ | 90.0 | 97.2 (+8.00\%) | 2210.55 | 2315.30 (+4.74\%) | 25.6 |
| The Thrill |  | 63.2 | 68.9 (+9.02\%) | 629.10 | 656.21 (+4.31\%) | 26.3 |
| Under Dogs |  | 81.9 | 86.2 (+5.25\%) | 2684.35 | 2630.66 (-2.00\%) | 29.9 |
| Crowbar Climber |  | 90.5 | 89.7 (-0.88\%) | 1180.66 | 1210.87 (+2.56\%) | 23.8 |
| All In One Sports | ✓ | 78.9 | 85.0 (+7.73\%) | 1712.01 | 1744.25 (+1.88\%) | 22.4 |
| Drone Simulator | ✓ | 100.0 | 101.2 (+1.20\%) | 1188.67 | 1170.21 (-1.56\%) | 21.6 |


the declared capabilities of the app. Requests involving data not covered by granted permissions, such as transmitting hardware identifiers without requesting READ_PHONE_STATE-were flagged and either blocked or sanitized. Our dynamic instrumentation framework is designed to offer a flexible and granular response to unauthorized data transmissions that goes beyond simple binary blocking. Instead of merely interrupting network requests; it can also (1) nullify outgoing payloads in real-time, (2) redirect traffic to controlled endpoints (e.g., a mock server for further analysis), or (3) alter only the securitysensitive data in outgoing payloads. This multifaceted approach allows for nuanced enforcement of privacy policies tailored to specific application behaviors and user preferences.

This combined approach of payload interception, permission-aware filtering, and endpoint redirection demonstrated that fine-grained, context-sensitive control over network flows is feasible at runtime, even in closed-source and obfuscated VR applications. Importantly, our method operates without requiring system-level privileges or permanent modifications to the app environment, offering a lightweight yet effective enforcement layer for user privacy.

## 5 Experimental Results

To evaluate the practicality, performance, and effectiveness of our proposed analysis framework, we conducted a series of experiments on real-world Oculus VR applications. All static and dynamic analyses were performed on a MacBook Air with an Apple M1 processor and 8 GB of RAM, using an Oculus Quest 2 headset as the target runtime environment. Our experimental setup required no modifications to the head-
set firmware and operated entirely within the bounds of standard user privileges. On average, our analysis pipeline processed approximately 70 MB of application data per minute, including unpacking, reverse engineering, instrumentation, and runtime evaluation. The following subsections present quantitative results on resource overhead, analysis throughput, and privacy enforcement effectiveness across a diverse set of applications.

Table 2 presents the resource overhead analysis of our instrumentation framework across fourteen VR applications. To assess the runtime impact of our system, we measured CPU and memory usage before and after instrumentation under identical conditions. Each application was executed for a fixed duration of 60 seconds, during which resource usage metrics were recorded once per second. The resulting 60 samples for both CPU and memory use were then averaged to obtain representative values for each scenario. This approach ensures that transient spikes or fluctuations in resource consumption do not skew the results, allowing for a stable comparison between the instrumented and baseline versions of each application.

As shown in Table 2, the resource usage values are averaged over a 60 -second runtime window, during which the average CPU and memory overhead remained below $10 \%$ for all applications. It is important to note that this overhead may be influenced by background activity within the applications themselves, rather than solely attributable to our instrumentation. In fact, during measurement, each application was kept idle on its start screen to minimize the impact of dynamic gameplay or user interactions. This controlled setup helps isolate the overhead introduced by instrumentation, suggesting that under typical usage scenarios, the performance impact would likely remain within acceptable bounds.

As shown in the table, the observed overhead is
minimal in most cases, with the average injection time remaining well below 30 milliseconds and resource consumption either comparable to or only marginally higher than the uninstrumented baseline. These findings confirm that our framework maintains a low runtime footprint, preserving application performance while enabling comprehensive privacy monitoring.

Out of the fourteen analyzed applications, six were found to transmit at least one type of potentially sensitive or personally identifiable data, as indicated by the checkmarks in the "Data Leak Detected" column of Table 2. These applications exhibited observable instances of data leakage through the UnityWebRequest interface, allowing us to intercept and inspect the transmitted values in real time. The remaining applications, while not leaking identifiable information in our experiments, still engaged in various forms of data transmission, warranting continued monitoring as application behavior may change over time or across updates.

To rigorously evaluate the effectiveness and reliability of our instrumentation framework, we conducted experiments on a diverse set of VR applications that included both benign and potentially privacy-invasive cases. This dual-pronged approach serves two critical objectives. (1) Transparency refers to the ability of our system to operate without interfering with or altering the legitimate functionality of benign applications. By demonstrating that normal application behavior remains unaffected during and after instrumentation, we ensure that our framework can be safely deployed in real-world settings without introducing unintended side effects or disrupting the user experience. (2) Soundness, on the other hand, reflects our system's capacity to comprehensively capture all relevant security and privacy events, particularly those involving unauthorized or excessive data exposure.

To systematically define what constitutes unauthorized data transmission, we performed a thorough analysis of each application's Android manifest file. This allowed us to infer the declared permissions and expected functionalities, forming a baseline for what types of data transmissions are semantically justified. Using this information, we derived context-aware security policies tailored to the capabilities of each application. These policies guided our runtime monitoring and enforcement mechanisms, enabling the interception of only those network communications that violated the inferred policy constraints. This methodology ensures that our system not only detects privacy violations with high fidelity but also maintains minimal false positives by respecting the functional scope explicitly declared by the application itself.

All applications tested in our study were singleplayer games. We did not evaluate multiplayer games because, although many applications utilize common networking libraries, each multiplayer implementation requires separate analysis and filtering. To demonstrate feasibility within our resource constraints, we focused on targeting the game engine's native networking library rather than addressing each third-party solution individually.

## 6 DISCUSSION

Challenges. One of the most significant challenges of our study is that the outgoing data from VR applications were transmitted in an encrypted form, necessitating decryption in order to analyze and inspect the transmitted content effectively. However, due to the lack of root privileges, access to the encryption keys was not possible, resulting in failure of the decryption process. This challenge rendered traditional network traffic decryption methods ineffective. As an alternative, it was necessary to perform code injection to intercept the data before it was encrypted and transmitted over the network.

Another significant challenge of our study is that the incompatibility of existing Android static analysis tools with Unity-based VR applications. Tools such as FlowDroid (Arzt et al., 2014), which rely on analyzing the control and data flow of Java/Kotlin bytecode (DEX format), are ineffective when applied to IL2CPP-compiled Unity applications. In such cases, the application's logic is translated into native C++ code, bypassing the conventional Android runtime environment. As a result, Android-based approaches fail to construct accurate taint propagation models or detect sensitive data flows, as the application no longer follows standard Android lifecycle methods or API usage patterns.

Another challenge of our study is that the AndroidManifest.xml file primarily defines hardware-related permissions and does not provide mechanisms to filter outbound destinations or payloads. Modifications to this file proved insufficient for implementing effective network-level filtering, as it lacks support for regulating runtime network communication behaviors.

While Unity provides standardized APIs for networking, monitoring their real-world usage is nontrivial. In production VR apps, data transmission typically occurs over encrypted channels, making it difficult to inspect raw traffic using traditional tools like Wireshark or Fiddler. Moreover, the closed nature of mobile and VR platforms often restricts the instal-
lation of root certificates or system-wide proxies, further limiting visibility into outbound communication.

These challenges necessitate in-process inspec-tion-i.e., observing network-related function calls as they happen within the app. This is particularly important when assessing whether an application transmits sensitive user data to third-party services.

Limitations. Despite thoroughly analyzing the source code of some suspicious applications, we found no explicit evidence of network-related methods, endpoints, or data transmissions. This absence strongly suggests that applications rely on external libraries or dynamically loaded components to perform network communication, thus obscuring these behaviors from static analysis. As our current approach is based on dynamic instrumentation, it is limited in its ability to capture network activity that is either abstracted away through native plugins or implemented outside the managed Unity environment. This represents a clear limitation of our work, indicating the need for deeper and more comprehensive runtime inspection methods, such as full traffic interception and native-level instrumentation.

Furthermore, dynamic instrumentation inherently observes only those execution paths that are triggered during runtime; certain network behaviors may remain undetected if not exercised during our testing. Additionally, while our hooks target the UnityWebRequest API, applications using alternative or obfuscated communication mechanisms may evade our analysis.

## 7 FUTURE WORKS

Extending Application Scope. Although our analysis covered only fourteen VR applications, data leakage or privacy-relevant behavior was observed in only a subset of them. In future work, we aim to analyze a significantly larger dataset-potentially hundreds of applications-spanning various app categories, interaction patterns, and deployment platforms. This will help improve the statistical significance of our findings and provide a more comprehensive view of privacy risks across the VR application ecosystem.
Enhancing Tool Coverage. Our dynamic instrumentation framework is currently tailored to Unity-based VR applications, leveraging their common architecture and event handling mechanisms. We focused on Unity because it is the most widely used AR/VR engine, with about $70 \%$ of developers identifying it as their primary platform (PatentPC, 2023). However, many VR apps are built with Unreal Engine,
which differs in runtime structure, memory layout, and method dispatching. In future work, we plan to extend our toolchain to Unreal-based applications by adapting injection and monitoring techniques to its unique characteristics, thereby broadening the applicability of our approach.
Adding Vulnerability Specific Injection. To move beyond general-purpose runtime monitoring, future work will incorporate injection strategies targeting known VR vulnerabilities, such as sensor-based inference attacks (e.g., keystroke or gesture inference), shared-state exploits, and perceptual manipulation techniques. We aim to simulate these attacks through crafted payloads or interaction scenarios in Unity- and Unreal-based environments, allowing us to evaluate how effectively our system detects or mitigates realistic, threat-specific behaviors without requiring elevated privileges or system-level access.

## 8 CONCLUSION

In this paper, we presented a comprehensive methodology for analyzing the privacy and security behaviors of Oculus VR applications by combining static reverse engineering and dynamic runtime instrumentation. Leveraging tools such as IL2CppDumper, dnSpy, and Frida, we successfully uncovered and monitored network communication patterns, including potentially sensitive data transmissions-without requiring access to the applications' source code or cooperation from the developers.

Our dynamic instrumentation framework enabled fine-grained interception and modification of network requests, allowing us to enforce security policies based solely on observed runtime behavior and declared permissions. Through extensive evaluation on fifteen popular VR applications, we demonstrated that our approach imposes minimal performance overhead, maintaining usability while providing deep insight into application behavior.

This work highlights the feasibility and significance of independent, application-level privacy enforcement in emerging VR platforms, where traditional network monitoring techniques often fail due to encryption and platform restrictions. Future work will explore expanding the framework to additional communication channels, automating policy derivation, and enabling real-time mitigation, all without relying on developer collaboration or code availability.

## ACKNOWLEDGEMENTS

In this study, the use of AI-based tools was restricted solely to language refinement and did not influence the scientific content. This work was supported by the Scientific Research Projects Coordination Unit of Ankara Yildirim Beyazit University under project number FBA-2023-2448.

## REFERENCES

Ahmed, K., Wang, Y., Lis, M., and Rubin, J. (2021). Vialin: Path-aware dynamic taint analysis for android. In Proceedings of the 43rd International Conference on Software Engineering (ICSE).
Arzt, S., Rasthofer, S., Fritz, C., Bodden, E., Bartel, A., Klein, J., Le Traon, Y., Octeau, D., and McDaniel, P. (2014). Flowdroid: Precise context, flow, field, objectsensitive and lifecycle-aware taint analysis for android apps. In Proceedings of the 35th ACM SIGPLAN Conference on Programming Language Design and Implementation (PLDI), pages 259-269.
Benz, M., Kristensen, E. K., Luo, L., Jr., N. P. B., Bodden, E., and Zeller, A. (2020). Heaps'n leaks: How heap snapshots improve android taint analysis. In Proceedings of the ACM Conference on Computer and Communications Security (CCS). Available via author's institutional repository.
ByteDance Ltd. (2023). Pico developer portal. https: //developer.picoxr.com. Accessed: 2025-06-10.
Cheng, K., Bhattacharya, A., Lin, M., Lee, J., Kumar, A., Tian, J. F., Kohno, T., and Roesner, F. (2024). When the user is inside the user interface: An empirical study of UI security properties in augmented reality. In 33rd USENIX Security Symposium (USENIX SS), pages 2707-2723.
Cong, S., Xiangyu, X., Tianfang, Z., Payton, W., Yi, W., Jian, L., Nitesh, S., Yingying, C., and Jiadi, Y. (2021). Face-mic: inferring live speech and speaker identity via subtle facial dynamics captured by AR/VR motion sensors. In Proceedings of the 27th Annual International Conference on Mobile Computing and Networking, MobiCom '21, page 478-490, New York, NY, USA. Association for Computing Machinery.
dnSpy Team (2025). dnspy: .net debugger and assembly editor. https://dnspy.org/. Accessed: 2025-06-14.
Fortune Business Insights (2024). Virtual reality market size, share \& covid-19 impact analysis. https://www.fortunebusinessinsights.com/industry-reports/virtual-reality-market-101378. Accessed: 2025-05-01.
Guo, H., Dai, H.-N., Luo, X., Zheng, Z., Xu, G., and He, F. (2024). An empirical study on oculus virtual reality applications: Security and privacy perspectives. In Proceedings of the IEEE/ACM 46th International Conference on Software Engineering, pages 1-13.
Inayoshi, H., Kakei, S., and Saito, S. (2023). Execution recording and reconstruction for detecting informa-
tion flows in android apps. IEEE Access, 11:1245612470.

Meta Platforms Inc. (2023). Meta quest developer documentation. https://developer.oculus.com. Accessed: 2025-06-10.
Nair, V., Guo, W., Mattern, J., Wang, R., O'Brien, J. F., Rosenberg, L., and Song, D. (2023). Unique identification of 50,000+ virtual reality users from head \& hand motion data. In 32nd USENIX Security Symposium (USENIX SS), pages 895-910.
PatentPC (2023). AR/VR developer ecosystem platform usage \& monetization stats. https: //patentpc.com/blog/ar-vr-developer-ecosystem-platform-usage-monetization-stats. Accessed: 2025-06-27.
Perfare (2018). Il2cppdumper. https://github.com/Perfare/ Il2CppDumper. Accessed: 2025-06-14.
Ravnås, O. A. V. (2025). Frida: Dynamic instrumentation toolkit. https://frida.re. Accessed: 2025-06-27.
SideQuest Ltd. (2025). Sidequest VR. https://sidequestvr. com/. Accessed: 2025-06-14.
Slocum, C., Zhang, Y., Abu-Ghazaleh, N., and Chen, J. (2023). Going through the motions:AR/VR keylogging from user head motions. In 32nd USENIX Security Symposium (USENIX Security 23), pages 159174.

Soundarya Jayaraman (2024). 60+ virtual reality statistics and trends (2024). https://www.g2.com/articles/ virtual-reality-statistics. Accessed: 2025-05-02.
Trimananda, R., Le, H., Cui, H., Ho, J. T., Shuba, A., and Markopoulou, A. (2022). OVRseen: Auditing network traffic and privacy policies in oculus VR. In 31st USENIX Security Symposium (USENIX Security 22), pages 3789-3806, Boston, MA. USENIX Association.
Unity Technologies (2025). Il2cpp scripting backend. Accessed: 2025-06-29.
Xu, R., Bao, Y., Yu, C., et al. (2021). Privacy and security in virtual reality: A survey. ACM Computing Surveys, 54(5):1-36.
Yang, Z., Li, C. Y., Bhalla, A., Zhao, B. Y., and Zheng, H. (2024). Inception attacks: Immersive hijacking in virtual reality systems. arXiv preprint arXiv:2403.05721.
Yu, B., Liu, Y., Ren, S., Zhou, Z., and Liu, J. (2025). Metaseen: analyzing network traffic and privacy policies in web 3.0 based metaverse. Digital Communications and Networks, 11(1):13-25.
Zhang, T., Ye, Z., Mahdad, A. T., Akanda, M. M. R. R., Shi, C., Wang, Y., Saxena, N., and Chen, Y. (2023). Facereader: Unobtrusively mining vital signs and vital sign embedded sensitive info via AR/VR motion sensors. In Proceedings of the 2023 ACM SIGSAC Conference on Computer and Communications Security, CCS '23, page 446-459, New York, NY, USA. Association for Computing Machinery.


[^0]:    ${ }^{\mathrm{a}}$ (D) https://orcid.org/0000-0002-3591-3606
    ${ }^{\mathrm{b}}$ (D) https://orcid.org/0009-0004-0552-0838
    ${ }^{\mathrm{c}}$ (D) https://orcid.org/0009-0006-3332-6236
    d(D) https://orcid.org/0009-0002-3124-0835
    ${ }^{\mathrm{e}}$ (D) https://orcid.org/0009-0003-6682-6622

