EXTRA_APPS = "gstreamer-tests ifupdown"
EXTRA_APPS_append_tegra124 = " mesa-demos"
EXTRA_APPS_append_tegra186 = " mesa-demos tegra-mmapi-samples cuda-samples"
EXTRA_APPS_append_tegra210 = " mesa-demos tegra-mmapi-samples cuda-samples"
RDEPENDS_${PN}-apps += "${EXTRA_APPS}"

