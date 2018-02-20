SUMMARY = "Go supplementary network support"
HOMEPAGE = "https://github.com/golang/net"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
SRC_URI = "git://github.com/golang/net;name=net \
           git://github.com/golang/crypto;name=crypto;destsuffix=git/src/${GO_IMPORT}/vendor/golang.org/x/crypto \
           git://github.com/golang/text;name=text;destsuffix=git/src/${GO_IMPORT}/vendor/golang.org/x/text \
           git://github.com/golang/sys;name=sys;destsuffix=git/src/${GO_IMPORT}/vendor/golang.org/x/sys \
"

require golang-x-srcrevs.inc

SRCREV_crypto = "${GOLANG_X_CRYPTO_SRCREV}"
SRCREV_net = "${GOLANG_X_NET_SRCREV}"
SRCREV_text = "${GOLANG_X_TEXT_SRCREV}"
SRCREV_sys = "${GOLANG_X_SYS_SRCREV}"
SRCREV_FORMAT = "net+crypto+text+sys"
PV="1.0+git${SRCPV}"

GO_IMPORT = "golang.org/x/net"
S = "${WORKDIR}/git"

inherit go

BBCLASSEXTEND = "native nativesdk"
