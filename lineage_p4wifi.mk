$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/samsung/p4wifi/p4wifi.mk)
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_p4wifi
PRODUCT_DEVICE := p4wifi
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := GT-P7510
PRODUCT_MANUFACTURER := Samsung
