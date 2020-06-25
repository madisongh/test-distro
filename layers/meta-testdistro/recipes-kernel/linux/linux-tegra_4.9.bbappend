FILESEXTRAPATHS_prepend := "${THISDIR}/linux-tegra-4.9:"
SRC_URI_remove = "file://defconfig"
SRC_URI += "file://systemd.cfg"
SRC_URI_append_jetson-tx2-cboot = " file://0001-Drop-security-engine-RSA-priority.patch"
SRC_URI_append_jetson-tx2-cboot = " file://test-signing-key.pem;subdir=git/certs"
SRC_URI_append_jetson-tx2-cboot = " file://module-signing.cfg file://dm-crypt.cfg"

DEPENDS += "openssl-native"

KBUILD_DEFCONFIG = "tegra_defconfig"
KCONFIG_MODE = "--alldefconfig"

inherit kernel-module-signing
