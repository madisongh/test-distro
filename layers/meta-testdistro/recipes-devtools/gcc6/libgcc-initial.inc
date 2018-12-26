require libgcc-common.inc

DEPENDS = "virtual/${TARGET_PREFIX}gcc"

LICENSE = "GPL-3.0-with-GCC-exception"

STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"

PACKAGES = ""

EXTRA_OECONF += "--disable-shared"

inherit nopackages

# We really only want this built by things that need it, not any recrdeptask
deltask do_build

do_configure_prepend() {
	install -d ${STAGING_INCDIR}
	touch ${STAGING_INCDIR}/limits.h
	sed -i -e 's#INHIBIT_LIBC_CFLAGS =.*#INHIBIT_LIBC_CFLAGS = -Dinhibit_libc#' ${B}/gcc/libgcc.mvars
	sed -i -e 's#inhibit_libc = false#inhibit_libc = true#' ${B}/gcc/Makefile
}


do_configure_append() {
	replace_symlink() {
		target=`readlink -f "$1"`
		tparent=`dirname "$target"`
		test -f "$tparent/gthr-single.h" || bberror "Cannot locate gthr-single.h in $tparent"
		ln -sf "$tparent/gthr-single.h" "$1"
	}
	gthr_symlinks=`find ${B}/${BPN} -type l -name gthr-default.h`
	for hdr in $gthr_symlinks; do
		replace_symlink $hdr
	done
}

do_install_append () {
	ln -s libgcc.a ${D}${libdir}/${TARGET_SYS}/${BINV}/libgcc_eh.a
}
