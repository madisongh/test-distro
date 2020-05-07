EXTRA_APPS = "gstreamer-tests haveged mesa-demos tegra-tools-tegrastats l4t-graphics-demos-egldevice l4t-graphics-demos-x11 nvidia-docker tegra-mmapi-samples cuda-samples gpu-burn libvisionworks vulkan-demos vulkan-tools"
EXTRA_DRIVERS = "kernel-module-hid-logitech-hidpp kernel-module-hid-logitech-dj kernel-module-uvcvideo"
RDEPENDS_${PN}-apps += "${EXTRA_APPS} ${EXTRA_DRIVERS}"
