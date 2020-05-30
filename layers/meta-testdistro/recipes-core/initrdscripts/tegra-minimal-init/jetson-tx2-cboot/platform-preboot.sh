platform_unseal_passphrase() {
    keystoretool --dmc-passphrase > "$1" 2>/dev/null
}

[ ! -x /usr/bin/setup-nv-boot-control ] || /usr/bin/setup-nv-boot-control

if [ -x /usr/sbin/nvbootctrl -a -x /usr/sbin/tegra-bootinfo ]; then
    curslot=`/usr/sbin/nvbootctrl get-current-slot`
    /usr/sbin/nvbootctrl mark-boot-successful
    /usr/sbin/tegra-bootinfo --check-status
    if [ $? = 77 ]; then
        slot=`expr 1 - $curslot`
        echo "Switching to boot slot $curslot"
        /usr/sbin/nvbootctrl set-active-boot-slot $slot
        /sbin/reboot -f
    fi
fi

while [ ! -b /dev/mmcblk0p1 ]; do
    sleep 1
done

decryptrootfs=
if [ -f /etc/init-luks ]; then
    . /etc/init-luks
    if unseal_passphrase; then
	decryptrootfs=yes
    fi
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

if [ -n "$mayberoot" ]; then
    if echo "$mayberoot" | grep -q '=' ; then
	rootdev=`blkid -l -o device -t $mayberoot`
    else
	rootdev="$mayberoot"
    fi
elif [ -n "$decryptrootfs" ]; then
    if open_encrypted_partition APP$slotsfx && [ -b /dev/mapper/APP$slotsfx ]; then
	rootdev="/dev/mapper/APP$slotsfx"
    else
	rootdev=`blkid --label APP$slotsfx`
	[ -n "$rootdev" ] || rootdev=`blkid -l -o device -t PARTLABEL=APP$slotsfx`
    fi
else
    rootdev=`blkid --label APP$slotsfx`
    [ -n "$rootdev" ] || rootdev=`blkid -l -o device -t PARTLABEL=APP$slotsfx`
fi

if [ -z "$rootdev" ]; then
    rootdev="/dev/mmcblk0p1"
fi
