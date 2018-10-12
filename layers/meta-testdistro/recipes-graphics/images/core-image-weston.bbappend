IMAGE_FEATURES += "ssh-server-openssh"
IMAGE_FEATURES_remove = "ssh-server-dropbear"

EXTRA_APPS = "gstreamer-tests" 
EXTRA_APPS_append_tegra186 = " mesa-demos tegra-mmapi-samples cuda-samples eglstreams-kms-example kernel-modules"
EXTRA_APPS_append_tegra194 = " mesa-demos cuda-samples eglstreams-kms-example kernel-modules"
EXTRA_APPS_append_tegra210 = " mesa-demos tegra-mmapi-samples cuda-samples eglstreams-kms-example"
CORE_IMAGE_BASE_INSTALL += "${EXTRA_APPS}"
