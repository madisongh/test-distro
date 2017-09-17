SUMMARY = "Go language packages"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

RDEPENDS_${PN} = "\
    go \
    golang-goprotobuf \
    golang-x-net \
    golang-x-text \
    golang-x-tools \
    go-helloworld \
    go-dep \
"
