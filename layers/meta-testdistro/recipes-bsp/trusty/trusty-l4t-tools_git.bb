SUMMARY = "Linux tools for Trusty Keystore app"
DESCRIPTION = "Linux programs for communicating with the keystore TA \
and generating an encrypted keyblob (EKB) for flashing"
HOMEPAGE = "https://github.com/madisongh/trusty-l4t"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=5e5799d70d07956d01af05a7a92ea0d7"

SRC_REPO ?= "github.com/madisongh/trusty-l4t.git;protocol=https"
SRCBRANCH ?= "keystore-32.2.3"
SRC_URI = "git://${SRC_REPO};branch=${SRCBRANCH}"
SRCREV ?= "${AUTOREV}"
S = "${WORKDIR}/git"

DEPENDS = "openssl"

inherit l4t_bsp autotools pkgconfig

PV = "32.2.3+git${SRCPV}"

S = "${WORKDIR}/git/tools"
B = "${WORKDIR}/build"

PACKAGES =+ "${PN}-eksgen"
FILES_${PN}-eksgen = "${bindir}/eksgen"

BBCLASSEXTEND = "native nativesdk"
