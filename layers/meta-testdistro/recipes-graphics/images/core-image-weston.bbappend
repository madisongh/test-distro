IMAGE_FEATURES += "ssh-server-openssh"
IMAGE_FEATURES_remove = "ssh-server-dropbear"

X11APPS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos tegra-mmapi-samples eglstreams-kms-example libgl-mesa nvgstapps', '', d)}"
EXTRA_APPS = "haveged"
EXTRA_APPS_append_tegra = " gstreamer-tests haveged tegra-tools-tegrastats gpu-burn l4t-graphics-demos cuda-samples ${X11APPS}"
EXTRA_DRIVERS = "kernel-module-hid-logitech-hidpp kernel-module-hid-logitech-dj kernel-module-uvcvideo"
CORE_IMAGE_BASE_INSTALL += "${EXTRA_APPS} ${EXTRA_DRIVERS}"
