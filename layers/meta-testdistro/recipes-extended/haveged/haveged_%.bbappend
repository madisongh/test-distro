FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-Fix-segfault-on-arm-machines.patch"

do_install_append() {
    sed -i -e's,/var/run,/run,g' \
           -e'/^DefaultDependencies=/d' \
           -e'/^Description=/aDefaultDependencies=no' \
        ${D}${systemd_system_unitdir}/haveged.service
    install -d ${D}${sysconfdir}/init.d
    install -m 0644 ${S}/init.d/sysv.redhat ${D}${sysconfdir}/init.d/haveged
    sed -i -e's,@SBIN_DIR@,${sbindir},g' ${D}${sysconfdir}/init.d/haveged
}
