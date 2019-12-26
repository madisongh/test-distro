DESCRIPTION = "Installer tegraflash package"
LICENSE = "MIT"

IMAGE_INSTALL = "packagegroup-core-boot tegra-boot-tools-installer haveged"
IMAGE_INSTALL += "gdbserver"
IMAGE_FEATURES = "empty-root-password allow-empty-password"
IMAGE_LINUGAS = ""

inherit core-image

IMAGE_FSTYPES = "tegraflash"
IMAGE_ROOTFS_SIZE = "131072"
KERNEL_ARGS_append = " root=PARTLABEL=INSTALLER"
