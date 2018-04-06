SUMMARY = "go-crazy"
HOMEPAGE = "https://github.com/gustavosbarreto/go-crazy"
LICENSE = "WTFPL"
LIC_FILES_CHKSUM = "file://${S}/src/${GO_IMPORT}/LICENSE;md5=8365d07beeb5f39d87e846dca3ae7b64"

GO_IMPORT = "github.com/gustavosbarreto/go-crazy"

SRC_URI = " \
    git://${GO_IMPORT};branch=master \
"

SRCREV = "7fac2b3582ccad4bee9fa57c443cd83de7ef46e3"

DEPENDS = "github.com-sirupsen-logrus golang-x-crypto golang-x-sys"

inherit go


do_configure_prepend() {
    rm -rf ${S}/src/${GO_IMPORT}/vendor
}

GO_INSTALL = " \
    ${GO_IMPORT} \
"
