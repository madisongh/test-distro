open_encrypted_partitions() {
    local luksdev=`blkid | grep 'PARTLABEL="crypt-' | cut -d: -f1`
    local luksname
    local UUID TYPE PARTLABEL PARTUUID vars

    [ -n "$luksdev" ] || return 0
    rm -rf /run/passphrase
    touch /run/passphrase
    chmod 600 /run/passphrase
    if ! platform_unseal_passphrase /run/passphrase; then
	echo "*** could not unseal passphrase ***"
	rm -f /run/passphrase
	exit 1
    fi
    echo -n "Unlocking partitions"
    blkid | grep 'PARTLABEL="crypt-' > /run/luks.list
    while IFS=: read luksdev vars; do
	eval $vars
	luksname=`echo $PARTLABEL | cut -d- -f2`
	if ! cryptsetup luksOpen --key-file /run/passphrase "$luksdev" "$luksname" >/dev/null 2>&1; then
	    echo -n "[FAIL $luksname]"
	    touch /run/cryptfail.$luksname
	else
	    echo -n "."
	fi
    done < /run/luks.list
    rm -f /run/luks.list
    rm -f /run/passphrase
    echo "[done]"
}
