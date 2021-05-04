DESCRIPTION = "Partition layout for tegra-sysinstall for upgrades"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

# Generate the new partition layout using the
# sysinstall-partition-layout recipe for the
# version you are upgrading to and copy it here.

SRC_URI = "file://partition_table"

COMPATIBLE_MACHINE = "(tegra)"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${datadir}/tegra-sysinstall
    install -m 0644 ${S}/partition_table ${D}${datadir}/tegra-sysinstall/
}

FILES_${PN} = "${datadir}/tegra-sysinstall"
PACKAGE_ARCH = "${MACHINE_ARCH}"
