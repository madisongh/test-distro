SRC_REPO = "github.com/madisongh/mender.git;protocol=https"
SRC_URI = "git://${SRC_REPO};branch=2.1.x"
SRCREV = "${AUTOREV}"
PV .= "+git${SRCPV}"

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://artifact-verify-key.pem"
LIC_FILES_CHKSUM = "file://src/github.com/mendersoftware/mender/LIC_FILES_CHKSUM.sha256;md5=1c872e33af7af0e7ee99e17f38dbcffc"
