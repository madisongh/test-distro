EXTRA_APPS = "gstreamer-tests ifupdown rng-tools mesa-demos"
EXTRA_DRIVERS = ""
EXTRA_APPS_append_tegra186 = " vulkan-demos vulkan-bin tegra-mmapi-samples cuda-samples"
EXTRA_DRIVERS_tegra186 = "kernel-modules"
EXTRA_APPS_append_tegra194 = " vulkan-demos vulkan-bin cuda-samples"
EXTRA_DRIVERS_tegra194 = "kernel-modules"
EXTRA_APPS_append_tegra210 = " vulkan-demos vulkan-bin tegra-mmapi-samples cuda-samples"
RDEPENDS_${PN}-apps += "${EXTRA_APPS} ${EXTRA_DRIVERS}"

