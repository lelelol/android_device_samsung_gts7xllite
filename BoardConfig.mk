#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 71303168
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600
BOARD_DTBOIMG_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 86888448
BOARD_SUPER_PARTITION_SIZE := 10171187200

# Inherit from sm7225-commmon
include device/samsung/sm7225-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/gts7xllite

# Display
TARGET_SCREEN_DENSITY := 320 # This density is wrong

# Kernel
TARGET_KERNEL_CONFIG += vendor/samsung/gts7xllite_defconfig

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_DEFAULT_TOUCH_ROTATION := ROTATION_RIGHT

# SELinux
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest.xml
