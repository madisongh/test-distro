IMAGE_FEATURES += "ssh-server-openssh"
IMAGE_FEATURES_remove = "ssh-server-dropbear"

X11APPS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'mesa-demos tegra-mmapi-samples eglstreams-kms-example', '', d)}"
EXTRA_APPS = "gstreamer-tests rng-tools tegra-tools-tegrastats gpu-burn"
EXTRA_APPS_append_tegra186 = " cuda-samples kernel-modules ${X11APPS}"
EXTRA_APPS_append_tegra194 = " cuda-samples kernel-modules ${X11APPS}"
EXTRA_APPS_append_tegra210 = " cuda-samples kernel-modules ${X11APPS}"
CORE_IMAGE_BASE_INSTALL += "${EXTRA_APPS}"
