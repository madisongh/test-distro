DESCRIPTION = "sysinstall upgrader BUP payload for Xavier"
LICENSE = "MIT"

COMPATIBLE_MACHINE = "(tegra194)"

INHIBIT_DEFAULT_DEPS = "1"

IMAGE_TEGRAFLASH_KERNEL = "${DEPLOY_DIR_IMAGE}/upgrader-kernel/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.cboot"

inherit nopackages image_types_tegra deploy kernel-artifact-names

deltask do_fetch
deltask do_unpack
deltask do_patch
deltask do_configure
deltask do_compile
deltask do_install
deltask do_populate_sysroot

do_deploy() {
    if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
        for imageType in ${KERNEL_IMAGETYPES} ; do
	    if [ "$imageType" = "fitImage" ] ; then
	        continue
	    fi
	    initramfs_symlink_name=${imageType}-sysinstall-upgrader
	    oe_make_bup_payload ${DEPLOY_DIR_IMAGE}/upgrader-kernel/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.cboot
	    install -d ${DEPLOYDIR}
	    install -m 0644 ${WORKDIR}/bup-payload/bl_update_payload ${DEPLOYDIR}/${initramfs_symlink_name}.bup-payload
	done
    fi
}
do_deploy[depends] += "sysinstall-upgrader-kernel:do_deploy ${SOC_FAMILY}-flashtools-native:do_populate_sysroot dtc-native:do_populate_sysroot"
do_deploy[depends] += "tegra186-redundant-boot:do_populate_sysroot tegra-bootfiles:do_populate_sysroot nv-tegra-release:do_populate_sysroot"
do_deploy[depends] += "coreutils-native:do_populate_sysroot cboot:do_deploy"
addtask deploy before do_build

PACKAGE_ARCH = "${MACHINE_ARCH}"
