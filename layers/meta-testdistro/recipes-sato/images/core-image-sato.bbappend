IMAGE_FEATURES += "ssh-server-openssh"
IMAGE_FEATURES_remove = "ssh-server-dropbear"
TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-cuda-sdk-host"
IMAGE_FSTYPES_jetson-tx2-cboot = "tar.gz"
inherit nopackages
