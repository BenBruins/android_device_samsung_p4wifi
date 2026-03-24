#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Architectuur (Tegra 2 heeft GEEN NEON)
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_CPU_VARIANT := generic
TARGET_BOARD_PLATFORM := tegra
TARGET_BOARD_PLATFORM_VARIANT := tegra2

ARCH_ARM_HAVE_NEON := false
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_VFP_D16 := true

# Include p4-common (Zorg dat deze repo ook aanwezig is in je broncode)
-include device/samsung/p4-common/BoardConfigCommon.mk

# Gebruik de non-open-source onderdelen
-include vendor/samsung/p4wifi/BoardConfigVendor.mk

# Partities
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 606076928
BOARD_CACHEIMAGE_PARTITION_SIZE := 462317159
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608

# Kernel (Nougat vereist een gepatchte kernel)
# Je zult waarschijnlijk een kernel broncode moeten gebruiken van bijv. Decatf
TARGET_KERNEL_SOURCE := kernel/samsung/p4
TARGET_KERNEL_CONFIG := p4wifi_defconfig
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_CMDLINE := video=tegrafb console=ttyS0,115200n8 usbcore.old_scheme_first=1 tegraboot=sdmmc core_edp_mv=1300 vmalloc=448M

# Nougat vereist specifieke compiler vlaggen voor Tegra 2
COMMON_GLOBAL_CFLAGS += -DTEGRA2_HACKS
COMMON_GLOBAL_CPPFLAGS += -DTEGRA2_HACKS

# SELinux (Noodzakelijk voor Nougat)
BOARD_SEPOLICY_DIRS += \
    device/samsung/p4wifi/sepolicy

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/samsung/p4wifi/rootdir/etc/egl.cfg
