do_install_append() {
	chmod 755 ${D}${libdir}/apt/apt.systemd.daily
}
