unseal_passphrase() {
    rm -rf /run/crypt
    mkdir -m 700 /run/crypt
    touch /run/crypt/passphrase
    chmod 600 /run/crypt/passphrase
    if ! platform_unseal_passphrase /run/crypt/passphrase; then
	echo "*** could not unseal passphrase ***"
	rm -rf /run/crypt
	return 1
    fi
    return 0
}

open_encrypted_partition() {
    local luksdev=`blkid -l -o device -t PARTLABEL="crypt-$1"`
    local luksname
    local UUID TYPE PARTLABEL PARTUUID vars

    [ -n "$luksdev" ] || return 1
    echo -n "Unlocking $1: "
    blkid | grep 'PARTLABEL="crypt-' > /run/luks.list
    if ! cryptsetup luksOpen --key-file /run/crypt/passphrase "$luksdev" "$1" >/dev/null 2>&1; then
	echo -n "[FAIL]"
	touch /run/cryptfail.$luksname
	return 1
    fi
    echo -n "[OK]"
    return 0
}
