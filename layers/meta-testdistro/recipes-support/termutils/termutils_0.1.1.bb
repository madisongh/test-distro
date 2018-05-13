SUMMARY = "Terminal utilities"
DESCRIPTION = "Small utilities for dealing with terminals"
HOMEPAGE = "https://github.com/madisongh/termutils"
SECTION = "console/utils"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=7d039b9a48908f094d9d93578290517f"

SRC_URI = "https://github.com/madisongh/termutils/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
	   file://00checkwinsize \
"

SRC_URI[md5sum] = "d23fa05a8ebdb9890b3a4600b4fbf718"
SRC_URI[sha256sum] = "a31184d820c8108c7ad83940c03f1ac529d385f3ee6ed961dd94759d6bf608fb"

S = "${WORKDIR}/${BPN}-${PV}"

inherit autotools

do_install_append() {
    install -d ${D}${sysconfdir}/profile.d
    install -m 644 ${WORKDIR}/00checkwinsize ${D}${sysconfdir}/profile.d
}
