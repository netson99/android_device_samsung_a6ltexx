#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/samsung/a6lte

# Audio
BOARD_USE_TFA_AMP := true

# Assert
TARGET_OTA_ASSERT_DEVICE := a6lte,a6ltexc,a6ltexx,a6ltelk

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Kernel
TARGET_KERNEL_CONFIG := exynos7870-a6lte_defconfig

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_a6lte
TARGET_RECOVERY_DEVICE_MODULES := libinit_a6lte

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/lib/libbauthserver.so|/vendor/lib/libbauthtzcommon_shim.so

# Wifi
TARGET_USES_64_BIT_BCMDHD        := true
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WPA_SUPPLICANT_USE_HIDL          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_NVRAM_PATH_PARAM     := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH           := "/vendor/etc/wifi/nvram_net.txt"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

# inherit from common
-include device/samsung/universal7870-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/a6lte/BoardConfigVendor.mk
