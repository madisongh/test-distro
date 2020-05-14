FILESEXTRAPATHS_prepend := "${THISDIR}/linux-tegra-4.9:"
SRC_URI += "file://systemd.cfg"
SRC_URI_append_jetson-tx2-cboot = " file://0001-Drop-security-engine-RSA-priority.patch"
SRC_URI_append_jetson-tx2-cboot = " file://test-signing-key.pem"
SRC_URI_append_jetson-tx2-cboot = " file://module-signing.cfg file://dm-crypt.cfg"

DEPENDS += "openssl-native"

do_configure_append_jetson-tx2-cboot() {
    if [ ! -e ${S}/certs/test-signing-key.pem ] || \
        ! cmp -s ${WORKDIR}/test-signing-key.pem ${S}/certs/test-signing-key.pem; then
        cp ${WORKDIR}/test-signing-key.pem ${S}/certs/
    fi
}

inherit kernel-module-signing
