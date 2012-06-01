## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := vs920

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/vs920/device_vs920.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := vs920
PRODUCT_NAME := cm_vs920
PRODUCT_BRAND := lge
PRODUCT_MODEL := vs920
PRODUCT_MANUFACTURER := lge
