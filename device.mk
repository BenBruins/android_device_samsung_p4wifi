#
# Copyright (C) 2011 The Android Open Source Project
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

# Cameradata
PRODUCT_COPY_FILES += \
    device/samsung/p4-common/camera/cameradata/back_camera_test_pattern.yuv:system/cameradata/back_camera_test_pattern.yuv \
    device/samsung/p4-common/camera/cameradata/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv \
    device/samsung/p4-common/camera/cameradata/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv \
    device/samsung/p4-common/camera/cameradata/front_camera_test_pattern.yuv:system/cameradata/front_camera_test_pattern.yuv

# Hdmi
PRODUCT_COPY_FILES += \
    device/samsung/p4-common/hdmi/dectable1.dat:system/etc/hdmi/dectable1.dat \
    device/samsung/p4-common/hdmi/dectable.dat:system/etc/hdmi/dectable.dat

# Wifi mfg
PRODUCT_COPY_FILES += \
    device/samsung/p4-common/wifi/bcmdhd_mfg.bin:system/etc/wifi/bcmdhd_mfg.bin

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/gpsconfig.xml:system/etc/gpsconfig.xml

# Nougat Low RAM optimalisaties (Cruciaal voor 1GB RAM)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    ro.config.max_starting_bg=2 \
    dalvik.vm.jit.codecachesize=0 \
    config.disable_atlas=true

# Algemene eigenschappen
PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only \
    ro.opengles.version=131072 \
    wifi.interface=wlan0

# Pakketten nodig voor Nougat
PRODUCT_PACKAGES += \
    libp3ril-apalone \
    setup_fs

# Dalvik/Heap configuratie voor tablet met 1GB RAM
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
