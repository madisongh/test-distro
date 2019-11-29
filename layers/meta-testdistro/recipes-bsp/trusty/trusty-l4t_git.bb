SRC_REPO ?= "github.com/madisongh/trusty-l4t.git;protocol=https"
SRCBRANCH ?= "patches-l4t-r${L4T_VERSION}"
SRC_URI = "git://${SRC_REPO};branch=${SRCBRANCH}"
SRCREV ?= "${AUTOREV}"
S = "${WORKDIR}/git"

inherit l4t_bsp

PV = "${L4T_VERSION}+git${SRCPV}"

require recipes-bsp/trusty/trusty-l4t.inc
