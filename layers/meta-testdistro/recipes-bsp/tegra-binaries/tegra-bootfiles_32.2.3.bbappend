EXTRADEPS = ""
EXTRADEPS_jetson-tx2-cboot = "custom-flash-layout bootfiles"
DEPENDS += "${EXTRADEPS}"
PARTITION_FILE_jetson-tx2-cboot = "${STAGING_DATADIR}/custom-flash-layout/${PARTITION_LAYOUT_TEMPLATE}"
MENDER_PARTITION_FILE_jetson-tx2-cboot = "${STAGING_DATADIR}/custom-flash-layout/${PARTITION_LAYOUT_TEMPLATE}"

do_install_append_jetson-tx2-cboot() {
    rm ${D}${datadir}/tegraflash/eks.img
    install -m 0644 ${STAGING_DATADIR}/bootfiles/eks.img ${D}${datadir}/tegraflash/
}
