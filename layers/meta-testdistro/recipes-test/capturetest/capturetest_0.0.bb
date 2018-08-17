DESCRIPTION = "Script for gstreamer capture test"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://capturetest.sh"

COMPATIBLE_MACHINE = "(tegra210|tegra186)"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/capturetest.sh ${D}${bindir}/capturetest
}

PACKAGE_ARCH = "${MACHINE_ARCH}"
