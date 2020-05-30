#!/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
mount -t proc proc /proc
mount -t devtmpfs none /dev
mount -t sysfs sysfs /sys
mount -t tmpfs -omode=0755,nodev,nosuid,strictatime tmpfs /run

rootdev=""
opt="rw"
wait=""

WDTPID=""
if [ -x /usr/sbin/wd_keepalive ]; then
    rm -f /run/wd_keepalive.pid
    /usr/sbin/wd_keepalive &
    count=0
    while [ $count -lt 10 ]; do
	WDTPID=`cat /run/wd_keepalive.pid 2>/dev/null`
	[ -z "$WDTPID" ] || break
	sleep 1
	count=`expr $count + 1`
    done
fi

[ ! -f /etc/platform-preboot ] || . /etc/platform-preboot

if [ -z "$rootdev" ]; then
    for bootarg in `cat /proc/cmdline`; do
	case "$bootarg" in
	    root=*) rootdev="${bootarg##root=}" ;;
	    ro) opt="ro" ;;
	    rootwait) wait="yes" ;;
	esac
    done
fi

if [ -n "$wait" -a ! -b "${rootdev}" ]; then
    echo "Waiting for ${rootdev}..."
    count=0
    while [ $count -lt 25 ]; do
	test -b "${rootdev}" && break
	sleep 0.1
	count=`expr $count + 1`
    done
fi
echo "Mounting ${rootdev}..."
mount -t ext4 -o "$opt" "${rootdev}" /mnt || exec sh

[ ! -f /etc/platform-pre-switchroot ] || . /etc/platform-pre-switchroot

echo "Switching to rootfs on ${rootdev}..."
mount --move /sys  /mnt/sys
mount --move /proc /mnt/proc
mount --move /dev  /mnt/dev
mount --move /run  /mnt/run

if [ -n "$WDTPID" ] && kill -0 "$WDTPID" 2>/dev/null ; then
    kill "$WDTPID"
    count=0
    while [ $count -lt 10 ]; do
	kill -0 "$WDTPID" 2>/dev/null || break
	sleep 1
	count=`expr $count + 1`
    done
    kill -0 "$WDTPID" 2>/dev/null && kill -9 "$WDTPID"
fi

exec switch_root /mnt /sbin/init
