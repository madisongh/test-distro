RDEPENDS_packagegroup-base += "termutils less procps strace ${SYSTEMDSTUFF}"
RDEPENDS_packagegroup-base_append_tegra = " tegra-startup"
SYSTEMDSTUFF = "${@'systemd-analyze' if d.getVar('VIRTUAL-RUNTIME_init_manager') == 'systemd' else ''}"
