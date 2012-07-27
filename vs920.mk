$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/vs920/vs920-vendor.mk)

PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/vs920/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

$(call inherit-product, build/target/product/full.mk)
# Inits
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rc:root/init.rc \
    $(LOCAL_PATH)/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/init.target.rc:root/init.target.rc \
	$(LOCAL_PATH)/init.qcom.rc:root/init.qcom.rc

# Init Scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.lge.usb.rc:root/init.lge.usb.rc \
    $(LOCAL_PATH)/prebuilt/boot_logo_00000.rle:root/bootimages/boot_logo_00000.rle \
    $(LOCAL_PATH)/prebuilt/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/prebuilt/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
    $(LOCAL_PATH)/prebuilt/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/atcmd_virtual_kbd.kl:system/usr/keylayout/atcmd_virtual_kbd.kl \
    $(LOCAL_PATH)/config/ffa-keypad_qwerty.kl:system/usr/keylayout/ffa-keypad_qwerty.kl \
    $(LOCAL_PATH)/config/i_vzw-keypad.kl:system/usr/keylayout/i_vzw-keypad.kl \
    $(LOCAL_PATH)/config/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    $(LOCAL_PATH)/config/thermald.conf:system/etc/thermald.conf

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/nvram.txt:system/etc/wl/nvram.txt \
    $(LOCAL_PATH)/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko \
	$(LOCAL_PATH)/prebuilt/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh


# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# HW HALS
PRODUCT_PACKAGES += \
    hdmid \
    libgenlock \
    libmemalloc \
    liboverlay \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    copybit.msm8660 \
    lights.msm8660 \
    gps.vs920 \
    audio.primary.msm8660 \
    audio_policy.msm8660 \
    audio.a2dp.default \
	com.android.future.usb.accessory

# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libmm-omxcore \
    libOmxCore

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

PRODUCT_PACKAGES += \
    hcitool \
    hciconfig \
    hwaddrs

# Charger mode
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Build.prop overrides	
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    mobiledata.interfaces=rmnet_sdio0,rmnet_sdio1 \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    DEVICE_PROVISIONED=1 \
    ro.telephony.ril_class=LGEQualcommUiccRIL \
    ro.telephony.ril.v3=qcomuiccstack \
    wifi.interface=wlan0 \
    debug.fb.rgb565=0 \
    debug.sf.hw=1 \
    debug.enabletr=true \
    debug.composition.type=dyn \
    persist.sys.usb.config=mtp,adb \
    ro.opengles.version=131072 \
    com.qc.hardware=true \
    ro.sf.compbypass.enable=1 \
    ro.hdmi.enable=true \
    com.qc.hdmi_out=true \
    ro.bt.bdaddr_path=/data/misc/bd_addr \
    ro.product.camera=lgvs920 \
    dev.pm.dyn_samplingrate=1 \
    ro.ril.shutdown=true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_vs920
PRODUCT_DEVICE := vs920
PRODUCT_MODEL := LG-Spectrum-4G
PRODUCT_MANUFACTURER := LGE
