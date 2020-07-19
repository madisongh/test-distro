BBLAYERS_CONF_UPDATE_FUNCS += " \
    conf/bblayers.conf:LCONF_DISTRO:DISTRO:testdistro_update_bblayersconf \
"

python testdistro_update_bblayersconf() {
    layer_distro = d.getVar('LCONF_DISTRO', True)
    build_distro = d.getVar('DISTRO', True)
    message = "You need to update bblayers.conf manually for this distro transition from {} to {}".format(layer_distro, build_distro)
    raise NotImplementedError(message)
}
