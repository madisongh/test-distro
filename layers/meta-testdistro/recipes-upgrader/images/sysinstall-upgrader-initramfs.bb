DESCRIPTION = "Minimal initramfs image for Tegra platforms"
LICENSE = "MIT"

TEGRA_INITRD_INSTALL ??= ""

PACKAGE_INSTALL = "\
    tegra-firmware-xusb \
    packagegroup-core-boot \
    tegra-sysinstall-tools \
    ${TEGRA_INITRD_INSTALL} \
"

IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login"
IMAGE_LINGUAS = ""

COPY_LIC_MANIFEST = "0"
COPY_LIC_DIRS = "0"

COMPATIBLE_MACHINE = "(tegra)"

KERNELDEPMODDEPEND = ""

IMAGE_ROOTFS_SIZE = "32768"
IMAGE_ROOTFS_EXTRA_SPACE = "0"

inherit core-image

PREFERRED_PROVIDER_virtual/bootloader_tegra186 = "cboot-prebuilt"
IMAGE_FSTYPES_forcevariable = "${INITRAMFS_FSTYPES}"
ROOTFS_POSTPROCESS_COMMAND .= "remove_kernel_image;"

# Hack to remove the installed kernel image, devicetree, extlinux
# stuff, since we normally boot with U-Boot and these files are
# included in MACHINE_ESSENTIAL_EXTRA_RDEPENDS and thus packagegroup-core-boot
remove_kernel_image() {
    for f in ${IMAGE_ROOTFS}/boot/*; do
        [ ! -e $f ] || rm -rf $f
    done
}

SSTATE_SKIP_CREATION_task-image-complete = "0"
SSTATE_SKIP_CREATION_task-image-qa = "0"
do_image_complete[vardepsexclude] += "rm_work_rootfs"
IMAGE_POSTPROCESS_COMMAND = ""

inherit nopackages
