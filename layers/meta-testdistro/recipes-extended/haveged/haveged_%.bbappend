do_install_append() {
    sed -i -e'/^Description=/aDefaultDependencies=no' ${D}${systemd_system_unitdir}/haveged.service
    # Hybrid systemd-sysvinit distros must install the initscript manually
    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
        install -d ${D}${INIT_D_DIR}
        sed -e "s,@SBINDIR@,${sbindir},g" <${S}/init.d/sysv.redhat >${D}${INIT_D_DIR}/haveged
        chmod 755 ${D}${INIT_D_DIR}/haveged
     fi
}
