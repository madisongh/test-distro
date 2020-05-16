EXTRA_OECMAKE += "-DBUILD_opencv_python2=OFF -DBUILD_opencv_python3=OFF \
                  -DWITH_GPHOTO2=OFF -DWITH_WEBP=OFF -DWITH_OPENEXR=OFF"

PACKAGECONFIG = "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
