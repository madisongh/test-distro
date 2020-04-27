SUMMARY = "Trusty secure OS with Keystore application"
DESCRIPTION = "Static keystore TA running in Trusty for Tegra platforms."
HOMEPAGE = "https://github.com/madisongh/keystore"
SRC_REPO ?= "github.com/madisongh/keystore.git;protocol=https"
SRCBRANCH ?= "master"
SRC_URI = "git://${SRC_REPO};branch=${SRCBRANCH}"
SRCREV ?= "${AUTOREV}"
S = "${WORKDIR}/git"

inherit l4t_bsp

PV = "32.4.2+git${SRCPV}"

require recipes-bsp/trusty/trusty-l4t.inc

LIC_FILES_CHKSUM_remove = " \
    file://app/sample/hwkey-agent/LICENSE;md5=0f2184456a07e1ba42a53d9220768479 \
    file://app/sample/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
"
