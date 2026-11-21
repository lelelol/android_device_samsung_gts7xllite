#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 71303168
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600
BOARD_DTBOIMG_PARTITION_SIZE := 10485760
BOARD_SUPER_PARTITION_SIZE := 10171187200

# Inherit from sm7225-commmon
include device/samsung/sm7225-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/gts7xllite

# Display
TARGET_SCREEN_DENSITY := 320

# Kernel
TARGET_KERNEL_CONFIG += vendor/samsung/gts7xllite.config
# PROJECT_NAME selects the Samsung techpack config (audio/display). Without it the
# filter() chain in techpack/audio/Makefile falls back to a TAS2562 config instead of
# lito_gts7plite (CS35L45), and the sound card waits forever for tas2562.
TARGET_KERNEL_ADDITIONAL_FLAGS += PROJECT_NAME=gts7xllite

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery (SM-T735 /dev/block/sda26 is 100663296 bytes; override common's 81788928)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
TARGET_OTA_ASSERT_DEVICE := gts7xllite
TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_RIGHT
TARGET_RECOVERY_DEFAULT_TOUCH_ROTATION := ROTATION_RIGHT

# Security patch (from stock T735XXS9DYF1 vendor/build.prop)
VENDOR_SECURITY_PATCH := 2025-06-01

# SELinux
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest.xml

# Board name (from SM-T735 stock boot.img header)
BOARD_NAME := SRPUB23B009
