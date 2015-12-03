SUMMARY = "Go language packages"
LICENSE = "MIT"

inherit packagegroup

RDEPENDS_${PN} = "\
    golang \
    golang-aws-sdk \
    golang-goprotobuf \
    golang-x-tools \
"
