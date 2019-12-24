EXTRADEPS = ""
EXTRADEPS_jetson-tx2-cboot = "custom-flash-layout"
DEPENDS += "${EXTRADEPS}"
PARTITION_FILE_jetson-tx2-cboot = "${STAGING_DATADIR}/custom-flash-layout/${PARTITION_LAYOUT_TEMPLATE}"
