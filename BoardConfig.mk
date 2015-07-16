# inherit from the proprietary version
-include vendor/kingzone/k1_turbo/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := mt6592
TARGET_NO_BOOTLOADER := true

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

TARGET_BOOTLOADER_BOARD_NAME := mt6592

TARGET_USERIMAGES_USE_EXT4:=true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# make_ext4fs requires numbers in dec format
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1468006400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5452595200
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/kingzone/k1_turbo/kernel
BOARD_CUSTOM_BOOTIMG_MK := device/kingzone/k1_turbo/bootimg.mk
BOARD_MKBOOTIMG_ARGS := --board 1419997733

TARGET_KMODULES := true

# Assert
TARGET_OTA_ASSERT_DEVICE := k1_turbo,htt92_wet_jb9

COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# EGL
BOARD_EGL_CFG := device/kingzone/k1_turbo/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

# RIL
BOARD_RIL_CLASS := ../../../device/kingzone/k1_turbo/ril/

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/kingzone/k1_turbo/bluetooth

#ifeq ($(RECOVERY_VARIANT=twrp), )
# TWRP Recovery
DEVICE_RESOLUTION := 1080x1920
BOARD_HAS_LARGE_FILESYSTEM := true
TW_NO_USB_STORAGE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
#TW_CUSTOM_BATTERY_PATH := /sys/devices/platform/mt6320-battery/power_supply/battery
TW_INTERNAL_STORAGE_PATH := "/emmc"
TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_RECOVERY_FSTAB := device/kingzone/k1_turbo/rootdir/twrp.fstab #unuse it when building cwm
#else
#Cwm Recovery
#DEVICE_RESOLUTION := 1080x1920
#TARGET_RECOVERY_FSTAB := device/kingzone/k1_turbo/rootdir/recovery.fstab #unuse it when building twrp
BOARD_HAS_NO_SELECT_BUTTON := true
#endif

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"

BOARD_SEPOLICY_DIRS := \
       device/kingzone/k1_turbo/sepolicy

BOARD_SEPOLICY_UNION := \
       device.te \
       app.te \
       system.te \
       netd.te \
       file_contexts
