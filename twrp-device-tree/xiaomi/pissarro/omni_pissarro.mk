#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from pissarro device
$(call inherit-product, device/xiaomi/pissarro/device.mk)

PRODUCT_DEVICE := pissarro
PRODUCT_NAME := omni_pissarro
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := pissarro
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_pissarro-user 12 SP1A.210812.016 V13.0.8.0.SKTINXM release-keys"

BUILD_FINGERPRINT := Xiaomi/vnd_pissarro/pissarro:12/SP1A.210812.016/V13.0.8.0.SKTINXM:user/release-keys
