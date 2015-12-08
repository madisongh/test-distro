SUMMARY = "Go language packages"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

RDEPENDS_${PN} = "\
    golang \
    golang-aws-sdk \
    golang-goprotobuf \
    golang-x-tools \
"
