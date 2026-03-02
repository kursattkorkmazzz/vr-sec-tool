# Silent Shield (VR Security Tool)

Dynamic instrumentation framework for analyzing and controlling privacy-sensitive network traffic in **Unity-based Meta Quest VR applications**.

Silent Shield intercepts `UnityWebRequest` calls at runtime (before TLS encryption), so you can inspect, log, redirect, or sanitize outbound data **without source code access and without root privileges**.

---

## Why this project exists

VR apps can transmit biometric- and device-related telemetry that users do not explicitly see. Traditional Android privacy analysis tools often fail on Unity IL2CPP apps.

Silent Shield addresses this gap by combining:

- **Static reverse engineering context** (`IL2CppDumper`, `dnSpy`)
- **Runtime instrumentation** (`Frida` + `frida-il2cpp-bridge`)
- **Policy-style runtime control** (listen, redirect, payload replacement)

This repository is the open implementation of the Silent Shield research line.

📄 Academic paper: [Open AcademicPaper.md](docs/AcademicPaper.md)

---

## What it can do

- Hook Unity networking entry points (`UnityWebRequest` constructors and setters)
- Intercept Unity Analytics request creation (when available in target app)
- Log outbound request activity in runtime
- Redirect traffic to a mock endpoint
- Replace upload payloads with sanitized/dummy content
- Measure injection timing (telemetry mode)

---

## Scope and limitations

- Primary target: **Unity + IL2CPP** VR applications
- Not designed for Unreal-based apps out of the box
- Dynamic analysis only sees executed code paths
- Apps using custom/native networking stacks may evade current hooks
- Use only on applications/devices you are authorized to analyze

---

## Repository layout

```text
src/
  main.ts                         # Frida script entry point
  core/config/Config.ts           # Runtime behavior switches
  core/platform/                  # UnityWebRequest / Analytics hook logic
scripts/
  injection-automation.sh         # APK pull + gadget injection + reinstall flow
  LookatProcessInformation.sh     # CPU/memory logging script
logs/
  frida_logs/                     # Collected runtime logs by app
  cpu_usage/                      # Performance measurement CSV files
assets/
  debuggedGadget/                 # Decompiled/injected sample artifacts
  test_arm64-gadget_dumped/       # IL2CPP dump artifacts
docs/                             # Paper and presentation materials
docker-compose.yaml               # Optional mock backend service
```

---

## Prerequisites

- Node.js `>=16`
- npm
- Python + `pip`
- `adb` (Android Debug Bridge)
- Frida CLI tools:

```bash
pip install frida-tools
```

- Meta Quest device with Developer Mode enabled

Optional (static workflow context):

- `IL2CppDumper`
- `dnSpy`

---

## Installation

```bash
git clone https://github.com/AybuVRSEC/vr-sec-tool.git
cd vr-sec-tool
npm install
npm run build
```

---

## Configuration

Edit `src/core/config/Config.ts`:

```ts
const Config = {
  CHANGE_DATA: false,
  MOCKUP_SERVER: "https://your-mock-server.example",
  JUST_LISTEN: true,
  TELEMETRY: false,
};
```

### Config keys

- `JUST_LISTEN`: passive tracing mode from `main.ts` (tracer-based)
- `CHANGE_DATA`: enables payload replacement hooks in active interception mode
- `MOCKUP_SERVER`: redirect target URL used by interception handlers
- `TELEMETRY`: logs injection-time metrics

---

## Quick start (end-to-end)

### 1) Build instrumentation script

```bash
npm run build
```

### 2) Inject Frida Gadget into target APK

```bash
./scripts/injection-automation.sh <output_folder> <apk_path_on_device> <package_name>
```

Example:

```bash
./scripts/injection-automation.sh pistolwhip /data/app/com.cloudheadgames.pistolwhip/base.apk com.cloudheadgames.pistolwhip
```

What this script does (automated):

- pulls APK from device
- injects/signs Frida Gadget build
- uninstalls original package
- installs injected APK
- attempts OBB copy/restore

### 3) Start runtime instrumentation

```bash
npm run frida
```

Or log to file:

```bash
npm run frida-log
```

### 4) Launch the VR app on the headset

Once the app starts, hooks/traces attach and runtime output appears in terminal/logs.

---

## Optional: run mock backend

```bash
docker compose up -d
```

Default service:

- image: `kursattkorkmazzz/vr-test-backend`
- port: `3000`

Use this for redirected traffic collection and payload observation.

---

## npm scripts

- `npm run build` → bundle `src/main.ts` into `dist/main-esbuild.js`
- `npm run watch` → rebuild on changes
- `npm run frida` → run Frida against `re.frida.Gadget`
- `npm run frida-log` → same run + tee output to `logs/log.txt`

---

## Research and documentation

- Main paper draft: [docs/AcademicPaper.md](docs/AcademicPaper.md)
---

## Responsible use

This framework is intended for:

- security research
- privacy auditing
- defensive testing

Do not use it on apps, devices, or accounts without explicit authorization.

---

## Citation

If you use this project in research, please cite the Silent Shield paper/work referenced in `docs/AcademicPaper.md`.

---

## Contact

Project contact: `agirgurkan.business@gmail.com`
