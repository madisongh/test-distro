do_configure_prepend() {
    sed -i -e's,udhcpc -n,udhcpc,g' ${S}/inet.defn
}
