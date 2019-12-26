PACKAGES =+ "${PN}-nvbootctrl"
FILES_${PN}-nvbootctrl = "${sbindir}/nvbootctrl ${sysconfdir}/nv_boot_control.conf"
INSANE_SKIP_${PN}-nvbootctrl = "ldflags"
RDEPENDS_${PN} += "${PN}-nvbootctrl"
