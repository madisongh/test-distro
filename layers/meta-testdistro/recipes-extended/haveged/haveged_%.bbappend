do_install_append() {
    sed -i -e'/^Description=/aDefaultDependencies=no' ${D}${systemd_system_unitdir}/haveged.service
}
