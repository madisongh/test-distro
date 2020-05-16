EXTRA_OECMAKE += "-DWITH_WEBP=OFF"

PACKAGECONFIG = "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
