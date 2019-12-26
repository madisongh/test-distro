FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://init-luks.sh"

do_configure_jetson-tx2-cboot() {
    rm -f ${WORKDIR}/platform-preboot-cboot.sh
}

do_install_append_jetson-tx2-cboot() {
    install -m 0644 ${WORKDIR}/init-luks.sh ${D}${sysconfdir}/init-luks
}

CRYPTFSDEPS = ""
CRYPTFSDEPS_jetson-tx2-cboot = "cryptsetup trusty-l4t-tools watchdog-keepalive-bin tegra-boot-tools tegra186-redundant-boot-nvbootctrl"
RDEPENDS_${PN} += "${CRYPTFSDEPS} util-linux-blkid"

PACKAGE_ARCH = "${MACHINE_ARCH}"
