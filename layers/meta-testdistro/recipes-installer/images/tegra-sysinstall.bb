DESCRIPTION = "Installer tegraflash package"
LICENSE = "MIT"

COMPATIBLE_MACHINE = "(tegra)"

IMAGE_INSTALL = "packagegroup-core-boot tegra-sysinstall-tools haveged"
IMAGE_FEATURES = "empty-root-password allow-empty-password"
IMAGE_LINUGAS = ""

inherit core-image

IMAGE_FSTYPES = "tegraflash"
IMAGE_ROOTFS_SIZE = "131072"
KERNEL_ARGS_append = " root=PARTLABEL=INSTALLER"
