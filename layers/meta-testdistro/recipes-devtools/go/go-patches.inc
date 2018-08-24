FILESEXTRAPATHS_prepend := "${THISDIR}/go-1.9:"
SRC_URI += " \
	file://0006-cmd-link-set-correct-alignment-of-ELF-note-section.patch \
	file://0007-link-drop-the-forced-use-of-gold-on-arm-aarch64.patch \
"
