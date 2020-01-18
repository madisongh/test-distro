SRC_REPO = "github.com/madisongh/mender;protocol=https"
SRC_URI = "git://${SRC_REPO};branch=2.1.x"
SRCREV = "${AUTOREV}"
PV .= "+git${SRCPV}"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://artifact-verify-key.pem"
