TD_BBLAYERS_CONF_VERSION ??= "unset-0"

python testdistro_update_bblayersconf() {
    current_version = d.getVar('TD_BBLAYERS_CONF_VERSION').split('-')

    required_version = (d.getVar('REQUIRED_TD_BBLAYERS_CONF_VERSION') or 'UNKNOWN-0').split('-')
    if required_version[0] == "UNKNOWN":
        # malformed configuration
        raise NotImplementedError("You need to update bblayers.conf manually for this version transition")

    if current_version[0] == required_version[0] and int(current_version[1]) == int(required_version[1]):
        return

    # On any mismatch, just use the template
    root = os.path.dirname(d.getVar('COREBASE'))
    newconf = sanity_conf_read(os.path.join(root, 'meta-testdistro', 'conf',
                                            'template-{}'.format(d.getVar('DISTRO')),
                                            'bblayers.conf.sample'))
    with open(bblayers_conf_file(d), "w") as f:
        f.write(''.join([line.replace('##OEROOT##', root).replace('##COREBASE##', root) for line in newconf]))
    bb.note("Your conf/bblayers.conf has been automatically updated.")
    return

}

BBLAYERS_CONF_UPDATE_FUNCS += " \
    conf/bblayers.conf:TD_BBLAYERS_CONF_VERSION:REQUIRED_TD_BBLAYERS_CONF_VERSION:testdistro_update_bblayersconf \
"
