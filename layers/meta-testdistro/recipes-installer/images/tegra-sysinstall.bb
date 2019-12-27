DESCRIPTION = "Installer tegraflash package"
LICENSE = "MIT"

IMAGE_INSTALL = "packagegroup-core-boot tegra-boot-tools-installer haveged"
IMAGE_INSTALL_remove = "mender"
IMAGE_FEATURES = "empty-root-password allow-empty-password"
IMAGE_LINUGAS = ""

inherit core-image

IMAGE_FSTYPES_forcevariable = "tegraflash"
IMAGE_ROOTFS_SIZE = "131072"
KERNEL_ARGS_append = " root=PARTLABEL=INSTALLER"
ROOTFS_POSTPROCESS_COMMAND_prepend = "ensure_data_exists;"
ROOTFS_POSTPROCESS_COMMAND_remove = "mender_update_fstab_file;"
ROOTFS_POSTPROCESS_COMMAND_remove = "mender_create_scripts_version_file;"

ensure_data_exists() {
    [ -d "${IMAGE_ROOTFS}/data" ] || install -d "${IMAGE_ROOTFS}/data"
}
