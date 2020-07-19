DISTRO = "testdistro"
DISTRO_NAME = "Test Distro"
DISTRO_VERSION = "3.2"
DISTRO_CODENAME = "master-test"
BUILDNAME ?= "${DISTRO_VERSION}${DISTRO_LAYER_BUILDTAG}"
BUILDNAME[vardepvalue] = "${DISTRO_VERSION}"
SDK_VENDOR = "-testsdk"
SDK_VERSION := "${@'${DISTRO_VERSION}'.replace('snapshot-${DATE}','snapshot')}"

MAINTAINER = "Matt Madison <matt@madison.systems>"

TARGET_VENDOR = "-td"

# XXX-
#       The following is being replaced with
#       a TD_ prefixed variable. This setting
#       is being retained for compatibility with
#       existing workspaces that used the core-resident
#       sanity check.  Remove in future.
# -XXX
LAYER_CONF_VERSION = "10"

# New ${DISTRO}-<version> setting for sanity checks.
# Increment version number (and the corresponding
# setting int the template bblayers.conf.sample file)
# each time the layer settings are changed.
REQUIRED_TD_BBLAYERS_CONF_VERSION = "${DISTRO}-1"

LOCALCONF_VERSION = "1"
SITE_CONF_VERSION = "2"

OE_IMPORTS += "oeaws.botos3fetcher"

TEST_DEFAULT_DISTRO_FEATURES = "opengl ptest multiarch wayland vulkan systemd pam virtualization"

DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${TEST_DEFAULT_DISTRO_FEATURES}"

SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${IMAGE_BASENAME}-${TUNE_PKGARCH}"
SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"

TESTQEMUDEPS = "${@bb.utils.contains("INCOMPATIBLE_LICENSE", "GPL-3.0", "", "packagegroup-core-device-devel",d)}"
DISTRO_EXTRA_RDEPENDS_append_qemuarm = " ${TESTQEMUDEPS}"
DISTRO_EXTRA_RDEPENDS_append_qemumips = " ${TESTQEMUDEPS}"
DISTRO_EXTRA_RDEPENDS_append_qemuppc = " ${TESTQEMUDEPS}"
DISTRO_EXTRA_RDEPENDS_append_qemux86 = " ${TESTQEMUDEPS}"
DISTRO_EXTRA_RDEPENDS_append_qemux86-64 = " ${TESTQEMUDEPS}"

TCLIBCAPPEND = ""

QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 ppc x86_64"
# Other QEMU_TARGETS "mips64el sh4"

PREMIRRORS ??= "\
bzr://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
cvs://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
git://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
gitsm://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
hg://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
osc://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
p4://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \n \
svn://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n"

MIRRORS =+ "\
ftp://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
http://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
https://.*/.*    http://downloads.yoctoproject.org/mirror/sources/ \n"

# The CONNECTIVITY_CHECK_URI's are used to test whether we can succesfully
# fetch from the network (and warn you if not). To disable the test set
# the variable to be empty.
# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD
CONNECTIVITY_CHECK_URIS ?= "https://www.example.com"

SANITY_TESTED_DISTROS ?= " \
            ubuntu-18.04 \n \
            ubuntu-18.10 \n \
            ubuntu-19.04 \n \
            ubuntu-19.10 \n \
            ubuntu-20.04 \n \
"

INHERIT_DISTRO = "debian devshell sstate sstate_mirror_update license remove-libtool uninative reproducible_build"
INHERIT_DISTRO += "distro_layer_buildinfo update-finished-booting-target testdistro-sanity"
require conf/distro/include/yocto-uninative.inc

GCCVERSION_aarch64 = "8.%"
SDKGCCVERSION = "10.%"
#
# OELAYOUT_ABI allows us to notify users when the format of TMPDIR changes in
# an incompatible way. Such changes should usually be detailed in the commit
# that breaks the format and have been previously discussed on the mailing list
# with general agreement from the core team.
#
OELAYOUT_ABI = "12"

PACKAGE_CLASSES ?= "package_rpm"

require conf/distro/include/security_flags.inc

LICENSE_FLAGS_WHITELIST_append = " commercial_faad2"

INIT_MANAGER = "systemd"

IMAGE_CLASSES_append_tegra = " tegrasign"

PREFERRED_PROVIDER_virtual/secure-os_tegra186 = "tos-keystore"
PREFERRED_PROVIDER_virtual/secure-os_tegra194 = "tos-keystore"
PREFERRED_RPROVIDER_libdevmapper = "lvm2"
