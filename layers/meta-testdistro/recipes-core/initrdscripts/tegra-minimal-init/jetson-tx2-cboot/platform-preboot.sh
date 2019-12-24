platform_unseal_passphrase() {
    keystoretool --dmc-passphrase > "$1" 2>&1
}

if [ -f /etc/init-luks ]; then
    . /etc/init-luks
    open_encrypted_partitions
fi

slotsfx=""
mayberoot=""
for bootarg in `cat /proc/cmdline`; do
    case "$bootarg" in
	boot.slot_suffix=*) slotsfx="${bootarg##boot.slot_suffix=}" ;;
	root=*) mayberoot="${bootarg##root=}" ;;
	ro) opt="ro" ;;
	rootwait) wait="yes" ;;
    esac
done
rootdev=`find_partition_by_label APP$slotsfx`
[ -n "$rootdev" ] || rootdev=`blkid -l -t PARTLABEL=APP$slotsfx | cut -d: -f1`
if [ -z "$rootdev" ]; then
    if [ -n "$mayberoot" ]; then
	rootdev="$mayberoot"
    else
	rootdev="/dev/mmcblk0p1"
    fi
fi
