DESCRIPTION = "Tegra system configuration scripts and files"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

COMPATIBLE_MACHINE = "(-)"
COMPATIBLE_MACHINE_tegra = "(tegra)"

SRC_URI = "\
	file://set-tegra-clocks.sh.in \
	file://set-tegra-clocks.service.in \
	file://set-tegra-clocks.timer \
"

S = "${WORKDIR}"
B = "${WORKDIR}/build"

inherit systemd

do_compile() {
    for f in set-tegra-clocks.sh set-tegra-clocks.service; do
	sed -e's,@SBINDIR@,${sbindir},g' \
	    ${S}/${f}.in > ${B}/${f}
    done
}

do_install() {
    install -d ${D}${sbindir}
    install -m 0755 ${B}/set-tegra-clocks.sh ${D}${sbindir}/set-tegra-clocks
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${B}/set-tegra-clocks.service ${D}${systemd_system_unitdir}
    install -m 0644 ${S}/set-tegra-clocks.timer ${D}${systemd_system_unitdir}
}

PACKAGE_ARCH = "${MACHINE_ARCH}"
FILES_${PN} += "${systemd_system_unitdir}"
SYSTEMD_SERVICE_${PN} = "set-tegra-clocks.timer"
ALLOW_EMPTY_${PN} = "1"
