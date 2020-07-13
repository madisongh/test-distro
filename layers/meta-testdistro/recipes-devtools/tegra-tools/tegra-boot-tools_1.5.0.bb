DESCRIPTION = "Boot-related tools for Tegra platforms"
HOMEPAGE = "https://github.com/madisongh/tegra-boot-tools"
LICENSE = "MIT & BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=f547d56278324f08919c3805e5fb8df9"

DEPENDS = "zlib"

SRC_URI = "https://github.com/madisongh/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
SRC_URI[sha256sum] = "d522912b32f2ed2017e0429802b16ad22446a92bc212a775acac51a9f5e25015"

EXTRA_OECONF = "--with-systemdsystemunitdir=${systemd_system_unitdir}"

inherit autotools pkgconfig systemd

SYSTEMD_SERVICE_${PN} = "finished-booting.target update_bootinfo.service"
PACKAGES =+ "${PN}-initramfs"
FILES_${PN}-initramfs = "${sbindir}/tegra-bootinfo"
RDEPENDS_${PN} = "${PN}-initramfs"
PACKAGE_ARCH_jetson-tx2-cboot = "${MACHINE_ARCH}"
