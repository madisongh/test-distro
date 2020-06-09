DESCRIPTION = "Installer tegraflash package"
LICENSE = "MIT"

COMPATIBLE_MACHINE = "(tegra)"

IMAGE_INSTALL = "packagegroup-core-boot tegra-sysinstall-tools haveged sysinstall-pkg"
IMAGE_INSTALL_append_secureboot = " lvm2-udevrules"
IMAGE_FEATURES = "empty-root-password allow-empty-password"
IMAGE_LINUGAS = ""

CORE_IMAGE_EXTRA_INSTALL_remove = "systemd-conf-prod"

inherit core-image

IMAGE_FSTYPES = "tegraflash"
IMAGE_ROOTFS_SIZE = "2097152"
IMAGE_ROOTFS_MAXSIZE = "2097152"
IMAGE_ROOTFS_EXTRA_SPACE = "0"
IMAGE_OVERHEAD_FACTOR = "1.0"
KERNEL_ARGS_append = " root=PARTLABEL=INSTALLER"
