# LineageOS 24.0 (Android 17) for the Galaxy Tab S7 FE LTE (SM-T735) — platform patches (`device/samsung/gts7xllite/patches`)

Unofficial, alpha-quality port for the **LTE model SM-T735** (`gts7xllite`, Snapdragon 750G),
4.19 kernel, vendor blobs from stock **T735XXS9DYF1** (Android 14, One UI 6). Tested on one device.

> **Vibe-coded.** Most of the bring-up was done with heavy help from an AI coding assistant
> (Claude Code): it read logs, proposed fixes and wrote most of the patches. Some fixes are
> pragmatic workarounds (for example the relaxed kernel-version checks below), not
> upstream-quality changes. Every change is a separate, documented commit. Reviews welcome.

## What is here
`aosp/` holds the changes to AOSP/LineageOS repositories that Android 17 needs on this
4.19-kernel, Android-11-vendor device:

| Repository | Why |
|---|---|
| `packages/modules/Connectivity` | NetBpfLoad/netd refuse kernels < 5.4 on 25Q2+; netd's 4.19 stats programs are capped at 25Q2; ConnectivityService needs BPF ring buffers (5.8+) for the local-network and loopback pollers |
| `system/bpf` | the ring-buffer test program is fatal on kernels without ring buffers |
| `hardware/interfaces` | hostapd: let vendor blobs link HIDL 1.1–1.3; health: the power_supply uevent BPF filter is optional |
| `packages/modules/vndk` | restore `com.android.vndk.v30` for the Android 11 blobs |
| `system/zygote` | zygote_next: skip capabilities the 4.19 kernel does not know (`cap_last_cap=37`; Chrome renderers aborted) |
| `hardware/qcom-caf/sm8250/media` | vdec: don't trap (ubsan) on the wrapping input userptr cookie |
| `frameworks/base`, `frameworks/libs/systemui` | keyguard/dream fix; ripple sparkle noise off (as on lineage-22.2) |

The device, common, kernel and vendor trees are separate repositories (branch `lineage-24.0`):
[device gts7xllite](https://github.com/lelelol/android_device_samsung_gts7xllite/tree/lineage-24.0),
[device sm7225-common](https://github.com/lelelol/android_device_samsung_sm7225-common/tree/lineage-24.0),
[kernel sm7225](https://github.com/lelelol/android_kernel_samsung_sm7225/tree/lineage-24.0),
[vendor sm7225-common](https://github.com/lelelol/android_vendor_samsung_sm7225-common/tree/lineage-24.0).

## Building
```bash
repo init -u https://github.com/LineageOS/android.git -b lineage-24.0 --git-lfs
mkdir -p .repo/local_manifests
curl -L -o .repo/local_manifests/gts7xllite.xml \
  https://raw.githubusercontent.com/lelelol/android_device_samsung_gts7xllite/lineage-24.0/patches/local_manifests/gts7xllite.xml
repo sync -c -j8
device/samsung/gts7xllite/patches/apply.sh .
source build/envsetup.sh
breakfast gts7xllite
m bacon
```
Sign with your own keys for anything you distribute. The Soong analysis of lineage-24.0 needs a lot
of memory (about 60 GB of RAM + swap).

## Credits
- **Blitzhagen**: the original LineageOS device, kernel and vendor trees for the Tab S7 FE.
- **The samsung-sm7225 team** ([github.com/samsung-sm7225](https://github.com/samsung-sm7225)): the
  lineage-23.2 trees this port is rebased on (Aflaungos, bgcngm, mikeNG, Simon1511, luk1337,
  ata-kaner, SebaUbuntu, Linux4, intervigilium, me-cafebabe and others).
- **The LineageOS Project** and its contributors; **Google / AOSP**.
- **Qualcomm / CodeAurora (qcom-caf)**: the sm8250 media stack built from source for hardware video.
- **Samsung**: kernel open source release and the stock vendor firmware.
- **The Xiaomi SM8250-common LineageOS vendor tree** (lineage-22.2): 64-bit Widevine blobs.
- **The MindTheGapps team**: the GApps package used for testing.
- Built with the help of **Claude Code** (Anthropic).

Patches keep the license of the repository they apply to (Apache-2.0 for AOSP/LineageOS,
GPL-2.0 for the kernel).
