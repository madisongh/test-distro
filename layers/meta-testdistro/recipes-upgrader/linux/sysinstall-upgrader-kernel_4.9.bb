require recipes-kernel/linux/linux-tegra_4.9.bb

# We only use this on Xavier since that platform
# bundles the initramfs into the kernel
COMPATIBLE_MACHINE = "(tegra194)"

KERNEL_PACKAGE_NAME = "upgrader-kernel"
INITRAMFS_IMAGE = "sysinstall-upgrader-initramfs"
