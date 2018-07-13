UPDATE_SSTATE_MIRROR ?= "0"

python sstate_mirror_update() {
    import os, shutil
    if d.getVar('SSTATE_SKIP_CREATION') == '1':
        return
    ss = sstate_state_fromvars(d)
    mirrordir = d.getVar("SSTATE_MIRRORDIR")[7:] # skipping over the file:// prefix, checked for below
    sstatepkg = d.getVar("SSTATE_PKG")
    mirrorpkg = os.path.join(mirrordir, d.getVar("SSTATE_PKGNAME") + '_' + ss['task'] + ".tgz")
    bb.utils.mkdirhier(os.path.dirname(mirrorpkg))
    lf = bb.utils.lockfile("%s.lock" % mirrorpkg)
    try:
        bb.debug(1, "copying: %s -> %s" % (sstatepkg, mirrorpkg))
        shutil.copyfile(sstatepkg, mirrorpkg)
        shutil.copyfile(sstatepkg + ".siginfo", mirrorpkg + ".siginfo")
    except IOError:
        bb.warn("error copying %s to %s" % (sstatepkg, mirrorpkg))
    bb.utils.unlockfile(lf)
}

python () {
    import os
    if d.getVar("UPDATE_SSTATE_MIRROR") == "1":
        mirrordir = d.getVar("SSTATE_MIRRORDIR")
        if not mirrordir or not mirrordir.startswith("file://") or not os.access(mirrordir[7:], os.W_OK):
            bb.note("SSTATE_MIRRORDIR not defined, non-local, or not writable, skipping updates")
            return
        for task in (d.getVar("SSTATETASKS") or "").split():
            postfuncs = (d.getVarFlag(task, "postfuncs") or "").split()
            if "sstate_task_postfunc" in postfuncs and "sstate_mirror_update" not in postfuncs:
                d.appendVarFlag(task, "postfuncs", " sstate_mirror_update")
                d.appendVarFlag(task, "vardepsexclude", " sstate_mirror_update")
}
