# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from p4wifi device configuration
$(call inherit-product, device/samsung/p4wifi/p4wifi.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_p4wifi
PRODUCT_DEVICE := p4wifi
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := GT-P7510
PRODUCT_MANUFACTURER := Samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=p4wifi \
    TARGET_DEVICE=p4wifi \
    BUILD_FINGERPRINT="samsung/p4wifi/p4wifi:4.0.4/IMM76D/UELPL:user/release-keys" \
    PRIVATE_BUILD_DESC="p4wifi-user 4.0.4 IMM76D UELPL release-keys"
