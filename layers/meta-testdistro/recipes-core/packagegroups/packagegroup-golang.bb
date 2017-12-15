SUMMARY = "Go language packages"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

RDEPENDS_${PN} = "\
    go \
    go-helloworld \
    go-dep \
"
