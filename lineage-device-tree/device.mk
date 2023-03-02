#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Rootdir
PRODUCT_PACKAGES += \
    setup_rcv2mainmic.sh \
    capture.sh \
    mishow.sh \
    playback_headset.sh \
    setup_topmic2headphone.sh \
    setup_rcv2topmic.sh \
    setup_headsetmic2headphone.sh \
    typec_capture_headset.sh \
    capture_headsetmic.sh \
    setup_headsetmic2rcv.sh \
    playback.sh \
    teardown_loopback.sh \
    typec_play_headset.sh \
    setup_mainmic2headphone.sh \
    init.insmod.sh \

PRODUCT_PACKAGES += \
    fstab.mt6877 \
    init.connectivity.rc \
    init.mt6877.usb.rc \
    init.mt6877.rc \
    meta_init.modem.rc \
    init.sensor_2_0.rc \
    init.connectivity.common.rc \
    multi_init.rc \
    factory_init.connectivity.rc \
    meta_init.project.rc \
    init.project.rc \
    init.modem.rc \
    factory_init.rc \
    factory_init.project.rc \
    init.cgroup.rc \
    meta_init.connectivity.rc \
    meta_init.connectivity.common.rc \
    meta_init.rc \
    init.mi_thermald.rc \
    init.aee.rc \
    init_conninfra.rc \
    init.ago.rc \
    factory_init.connectivity.common.rc \
    miui.factoryreset.rc \
    init.recovery.hardware.rc \
    init.recovery.mt6877.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6877:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.mt6877

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/pissarro/pissarro-vendor.mk)