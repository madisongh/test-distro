SUMMARY = "Go language packages"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

RDEPENDS_${PN} = "\
    golang \
    golang-goprotobuf \
    golang-x-tools \
    golang-x-text \
    golang-x-net \
    golang-x-crypto \
"
