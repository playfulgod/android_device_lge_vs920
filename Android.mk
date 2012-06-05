ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),spectrum)
include $(call first-makefiles-under,$(call my-dir))
endif
