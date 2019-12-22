SRC_REPO ?= "github.com/madisongh/trusty-l4t.git;protocol=https"
SRCBRANCH ?= "keystore-${L4T_VERSION}"
SRC_URI = "git://${SRC_REPO};branch=${SRCBRANCH}"
SRCREV ?= "${AUTOREV}"
S = "${WORKDIR}/git"

inherit l4t_bsp

PV = "${L4T_VERSION}+git${SRCPV}"

require recipes-bsp/trusty/trusty-l4t.inc

LIC_FILES_CHKSUM_remove = " \
    file://app/keystore-demo/LICENSE;md5=7100b53ab2e3231bd0ba50d55a53fbef \
    file://app/sample/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
"
