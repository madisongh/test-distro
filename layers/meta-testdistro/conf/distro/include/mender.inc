INHERIT_DISTRO += "mender-full tegra-mender-setup mender-workarounds mendersign"
MENDER_SERVER_URL = "https://hosted.mender.io"
MENDER_ARTIFACT_NAME ?= "${IMAGE_BASENAME}_${BUILDNAME}"
MENDER_FEATURES_ENABLE_remove = "mender-growfs-data"
