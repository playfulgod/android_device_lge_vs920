## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

TARGET_BOOTANIMATION_NAME := vertical-720x1280

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/vs920/vs920.mk)

PRODUCT_NAME := cm_vs920

# Release name and versioning
PRODUCT_RELEASE_NAME := VS920 4G
PRODUCT_VERSION_DEVICE_SPECIFIC :=

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := vs920

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=i_vzw BUILD_FINGERPRINT=Verizon/lge_iprj/VS920:4.0.4/IMM76D/VS920ZV7.47d6aee9:user/release-keys PRIVATE_BUILD_DESC="i_vzw-user 4.0.4 IMM76D eng.yeoncheol.hong release-keys"

# Enable Torch
PRODUCT_PACKAGES += Torch
