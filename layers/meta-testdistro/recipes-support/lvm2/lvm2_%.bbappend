FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://0001-enable-coldplug-with-non-udev-initrd.patch"
PACKAGECONFIG = "odirect dmeventd udev"
