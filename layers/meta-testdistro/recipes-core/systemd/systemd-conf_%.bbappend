FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://networkd-wait-any.conf"
SRC_URI += "file://system-overrides.conf"
SRC_URI_append_jetson-tx2-cboot = " file://crypttab"
SRC_URI_append_jetson-tx2-cboot = " file://dmcrypt-cleanup.service"

inherit systemd

do_install_append() {
    install -d ${D}${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d
    install -m 0644 ${WORKDIR}/networkd-wait-any.conf ${D}${sysconfdir}/systemd/system/systemd-networkd-wait-online.service.d/
}

do_install_append_jetson-tx2-cboot() {
    install -d ${D}${sysconfdir}/systemd/system.conf.d
    install -m 0644 ${WORKDIR}/system-overrides.conf ${D}${sysconfdir}/systemd/system.conf.d/99-system-overrides.conf
    install -m 0644 ${WORKDIR}/crypttab ${D}${sysconfdir}/
    install -d ${D}${sysconfdir}/systemd/system
    install -m 0644 ${WORKDIR}/dmcrypt-cleanup.service ${D}${sysconfdir}/systemd/system/
}

SYSTEMD_SERVICE_${PN}_append_jetson-tx2-cboot = " dmcrypt-cleanup.service"
FILES_${PN} += "${sysconfdir}/systemd ${sysconfdir}/crypttab"
