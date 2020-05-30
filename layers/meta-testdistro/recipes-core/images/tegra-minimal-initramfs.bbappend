ROOTFS_POSTPROCESS_COMMAND += "remove_udev;"
FORCE_RO_REMOVE = "0"

remove_udev() {
    rm -rf ${IMAGE_ROOTFS}${sysconfdir}/udev
    rm -rf ${IMAGE_ROOTFS}${sysconfdir}/systemd
    rm -rf ${IMAGE_ROOTFS}${nonarch_base_libdir}/systemd
    rm -rf ${IMAGE_ROOTFS}${nonarch_base_libdir}/udev
    rm -rf ${IMAGE_ROOTFS}${datadir}/bash-completion
    rm -rf ${IMAGE_ROOTFS}${libexecdir}/udevadm
    rm -rf ${IMAGE_ROOTFS}${sbindir}/udev*
    rm -rf ${IMAGE_ROOTFS}${bindir}/udev*
    rm -rf ${IMAGE_ROOTFS}${base_bindir}/udev*
    rm -rf ${IMAGE_ROOTFS}${base_bindir}/systemd-hwdb
}
