DESCRIPTION = "Test meson cuda builds"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"

SRC_URI = "git:///sources/meson;branch=master"
SRCREV = "${AUTOREV}"
PV = "0.55+g${SRCPV}"


inherit cuda meson

#TESTCASE = "10 cuda dependency"
#TESTCASE = "11 cuda dependency (nvcc)"
#TESTCASE = "12 cuda dependency (mixed)"
#TESTCASE = "1 simple"
#TESTCASE = "2 split"
#TESTCASE = "3 cudamodule"
#TESTCASE = "4 shared"
#TESTCASE = "5 threads"
#TESTCASE = "6 std"
#TESTCASE = "7 static vs runtime"
#TESTCASE = "8 release"
#TESTCASE = "9 optimize for space"
S = "${WORKDIR}/git/test cases/cuda/${TESTCASE}"
B = "${WORKDIR}/build"


