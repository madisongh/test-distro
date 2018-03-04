SUMMARY = "Go language packages"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

RDEPENDS_${PN} = "\
    go \
    go-helloworld \
    go-dep \
    golang-x-crypto-ptest \
    golang-x-net-ptest \
    golang-x-sys-ptest \
    golang-x-text-ptest \
"
