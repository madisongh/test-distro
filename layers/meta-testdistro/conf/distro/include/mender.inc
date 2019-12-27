INHERIT_DISTRO += "mender-full tegra-mender-setup"
MENDER_FEATURES_ENABLE_append = " mender-growfs-data"
MENDER_SERVER_URL = "https://hosted.mender.io"
MENDER_ARTIFACT_NAME = "${BUILDNAME}"
