DESCRIPTION = "Tegra boot and installation tools"
HOMEPAGE = "https://github.com/madisongh/tegra-boot-tools"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=5e5799d70d07956d01af05a7a92ea0d7"

DEPENDS = "zlib"

SRC_REPO ?= "/sources/tegra-boot-tools"
SRCBRANCH ?= "master"
SRC_URI = "git://${SRC_REPO};branch=${SRCBRANCH}"
SRCREV = "${AUTOREV}"
PV = "1.0+git${SRCPV}"

S = "${WORKDIR}/git"

EXTRA_OECONF = "--with-systemdsystemunitdir=${systemd_system_unitdir}"

inherit autotools pkgconfig systemd

PACKAGES =+ "${PN}-installer"

SYSTEMD_SERVICE_${PN} = "finished-booting.target update_bootinfo.service"

FILES_${PN}-installer = "${sbindir}/tegra-sysinstall* ${datadir}/tegra-boot-tools"
RDEPENDS_${PN}-installer = "${PN} tar cryptsetup trusty-l4t-tools tegra186-redundant-boot \
                            bash curl util-linux-blkid util-linux-lsblk util-linux-mountpoint \
                            parted gptfdisk e2fsprogs util-linux-mkfs util-linux-mount \
                            util-linux-umount"

