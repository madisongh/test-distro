FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://networkd-wait-any.conf"
SRC_URI += "file://system-overrides.conf"

do_install_append() {
    install -d ${D}${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d
    install -m 0644 ${WORKDIR}/networkd-wait-any.conf ${D}${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d/
    install -d ${D}${sysconfdir}/systemd/system.conf.d
    install -m 0644 ${WORKDIR}/system-overrides.conf ${D}${sysconfdir}/systemd/system.conf.d/99-system-overrides.conf
}

FILES_${PN} += "${sysconfdir}/systemd"
