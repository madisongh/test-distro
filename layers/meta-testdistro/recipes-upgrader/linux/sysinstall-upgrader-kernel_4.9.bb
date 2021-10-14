require recipes-kernel/linux/linux-tegra_4.9.bb

COMPATIBLE_MACHINE = "(tegra194|tegra186)"

KERNEL_PACKAGE_NAME = "upgrader-kernel"
INITRAMFS_IMAGE = "sysinstall-upgrader-initramfs"
INITRAMFS_IMAGE_BUNDLE = "1"

bootimg_from_bundled_initramfs() {
    if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
        rm -f ${WORKDIR}/initrd
        touch ${WORKDIR}/initrd
        for imageType in ${KERNEL_IMAGETYPES} ; do
            if [ "$imageType" = "fitImage" ] ; then
                continue
            fi
            initramfs_base_name=${imageType}-${INITRAMFS_NAME}
            initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
            ${STAGING_BINDIR_NATIVE}/tegra186-flash/mkbootimg \
                                    --kernel $deployDir/${initramfs_base_name}.bin \
                                    --ramdisk ${WORKDIR}/initrd \
                                    --output $deployDir/${initramfs_base_name}.cboot
            chmod 0644 $deployDir/${initramfs_base_name}.cboot
            ln -sf ${initramfs_base_name}.cboot $deployDir/${initramfs_symlink_name}.cboot
        done
    elif [  -z "${INITRAMFS_IMAGE}" ]; then
        rm -f ${WORKDIR}/initrd
        touch ${WORKDIR}/initrd
        for imageType in ${KERNEL_IMAGETYPES} ; do
            if [ "$imageType" = "fitImage" ] ; then
                continue
            fi
	    baseName=$imageType-${KERNEL_IMAGE_NAME}
            ${STAGING_BINDIR_NATIVE}/tegra186-flash/mkbootimg \
                                    --kernel $deployDir/${baseName}.bin \
                                    --ramdisk ${WORKDIR}/initrd \
                                    --output $deployDir/${baseName}.cboot
            chmod 0644 $deployDir/${baseName}.cboot
            ln -sf ${baseName}.cboot $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.cboot
            ln -sf ${baseName}.cboot $deployDir/$imageType.cboot
        done
    fi
}

do_deploy_append() {
  bootimg_from_bundled_initramfs
}
do_deploy[depends] += "tegra186-flashtools-native:do_populate_sysroot gzip-native:do_populate_sysroot"
