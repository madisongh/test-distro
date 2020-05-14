FILESEXTRAPATHS_prepend := "${THISDIR}/linux-tegra-4.9:"
SRC_URI += "file://systemd.cfg"
SRC_URI_append_jetson-tx2-cboot = " file://0001-Drop-security-engine-RSA-priority.patch"
SRC_URI_append_jetson-tx2-cboot = " file://test-signing-key.pem"
SRC_URI_append_jetson-tx2-cboot = " file://module-signing.cfg file://dm-crypt.cfg"

DEPENDS += "openssl-native kern-tools-native"

do_configure() {
    touch ${B}/.scmversion ${S}/.scmversion
    configs="${WORKDIR}/defconfig $(ls -1 ${WORKDIR}/*.cfg)"
    cd ${S}
    CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${configs} 2>&1
    if [ $? -ne 0 -o ! -f ${B}/.config ]; then
        bbfatal "merge_config.sh failed"
    fi
    cd ${B}
}

do_configure_append_jetson-tx2-cboot() {
    if [ ! -e ${S}/certs/test-signing-key.pem ] || \
        ! cmp -s ${WORKDIR}/test-signing-key.pem ${S}/certs/test-signing-key.pem; then
        cp ${WORKDIR}/test-signing-key.pem ${S}/certs/
    fi
}

inherit kernel-module-signing
