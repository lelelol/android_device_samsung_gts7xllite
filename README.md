# LineageOS 24.0 (Android 17) device tree for the Samsung Galaxy Tab S7 FE LTE (SM-T735)

Branch `lineage-24.0` brings this tree up on LineageOS 24.0 for the **LTE model SM-T735**
(`gts7xllite`, Snapdragon 750G / SM7225), with vendor blobs from stock firmware
**T735XXS9DYF1** (Android 14, One UI 6). It is an unofficial, alpha-quality port tested on one device.

> **Vibe-coded.** Most of the bring-up was done with heavy help from an AI coding assistant
> (Claude Code): it read logs, proposed fixes and wrote most of the patches. Every change is a
> separate, documented commit so it can be reviewed. Corrections are welcome.

## Related repositories (branch `lineage-24.0`)
| Path | Repository |
|---|---|
| `device/samsung/gts7xllite` | [lelelol/android_device_samsung_gts7xllite](https://github.com/lelelol/android_device_samsung_gts7xllite) |
| `device/samsung/sm7225-common` | [lelelol/android_device_samsung_sm7225-common](https://github.com/lelelol/android_device_samsung_sm7225-common) |
| `kernel/samsung/sm7225` | [lelelol/android_kernel_samsung_sm7225](https://github.com/lelelol/android_kernel_samsung_sm7225) |
| `vendor/samsung/sm7225-common` | [lelelol/android_vendor_samsung_sm7225-common](https://github.com/lelelol/android_vendor_samsung_sm7225-common) |
| AOSP/LineageOS patches | [`patches/`](patches) in this repository |

All SM-T735 blobs live in the common vendor tree; `vendor/samsung/gts7xllite` is not used on
lineage-24.0. Build instructions (local manifest, patches, `breakfast gts7xllite`) are in
[`patches/README.md`](patches/README.md).

Android 17 dropped support for several things this 4.19-kernel, Android-11-vendor device relies on
(BPF ring buffers, the OMX service, the VNDK linker namespace…). The patch series above holds the
platform changes (netd/NetBpfLoad kernel checks, zygote capabilities, qcom-caf vdec, …) needed on
top of LineageOS 24.0.

## Tablet specifications

Basic    | Spec Sheet
--------:|:----------------------
SoC      | Qualcomm Snapdragon 750G
CPU      | Octa-core (6x1.8ghz Kryo 570 & 2x2.2ghz Cortex A77)
GPU      | Adreno 619
Memory   | 4,6,8GB RAM
Storage  | 64,128,256GB UFS
Expansion | Expandable up to 1TB via microSD
Shipped Android version | Android 11, OneUI 3
Battery  | Li-ion 10090mAh, non-removable, 45W Wired
Display  | TFT LCD, 60Hz, 12.4 inches, 2560 x 1600 pixels, 16:10 ratio
Camera Back  | 8 MP
Camera Front | 5 MP
Video        | 1080p@30fps
Sensors      | Gyroscope, Compass, Proximity Sensor, Accelerometer

## Credits
- **Blitzhagen**: the original LineageOS device, kernel and vendor trees for the Tab S7 FE
  (gts7xllite / sm7225) that these repositories are forked from.
- **The samsung-sm7225 team** ([github.com/samsung-sm7225](https://github.com/samsung-sm7225)):
  the lineage-23.2 trees this port is rebased on, with work by Aflaungos, bgcngm, mikeNG,
  Simon1511, luk1337, ata-kaner, SebaUbuntu, Linux4, intervigilium, me-cafebabe and others.
- **The LineageOS Project** and its contributors: the OS, recovery, extract-utils, hardware/samsung.
- **Qualcomm / CodeAurora (qcom-caf)**: the sm8250 media stack built from source for hardware video.
- **Samsung**: kernel open source release and the stock vendor firmware.
- **The Xiaomi SM8250-common LineageOS vendor tree** (lineage-22.2): 64-bit Widevine blobs.
- **The MindTheGapps team**: the GApps package used for testing.
- **Google / AOSP**.
- Built with the help of **Claude Code** (Anthropic).

## Copyright

```
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
```
