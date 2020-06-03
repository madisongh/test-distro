DESCRIPTION = "Boot-related tools for Tegra platforms"
HOMEPAGE = "https://github.com/madisongh/tegra-boot-tools"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=5e5799d70d07956d01af05a7a92ea0d7"

DEPENDS = "zlib"

SRC_REPO ?= "github.com/madisongh/tegra-boot-tools.git;protocol=https"
SRCBRANCH ?= "master"
SRC_URI = "git://${SRC_REPO};branch=${SRCBRANCH}"
SRCREV = "${AUTOREV}"
PV = "1.3+git${SRCPV}"

S = "${WORKDIR}/git"

EXTRA_OECONF = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
EXTRA_OECONF_append_jetson-tx2-cboot = " --with-extended-sector-count=511"

inherit autotools pkgconfig systemd

SYSTEMD_SERVICE_${PN} = "finished-booting.target update_bootinfo.service"
PACKAGES =+ "${PN}-initramfs"
FILES_${PN}-initramfs = "${sbindir}/tegra-bootinfo"
RDEPENDS_${PN} = "${PN}-initramfs"
PACKAGE_ARCH_jetson-tx2-cboot = "${MACHINE_ARCH}"
