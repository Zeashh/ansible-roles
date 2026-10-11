#!/bin/bash

# Exit in case of any error
set -e
trap 'logger -t headscale-backup "Fatal error at line $LINENO, refusing to run any more commands" >&2' ERR

if [[ $UID != 0 ]]; then
	echo "This script must be run as root or using sudo"
	exit 1;
fi

# Variables
_backup_tmp=$2

case $1 in
	prepare)
		sync
		mkdir -p $_backup_tmp
		chmod 0775 $_backup_tmp
		cp -aR /etc/headscale $_backup_tmp/etc-headscale
		cp -aR /var/lib/headscale $_backup_tmp/var-lib-headscale
		tar -czvf $_backup_tmp.tgz $_backup_tmp
	;;
	delete)
		rm -rf $_backup_tmp
		rm -f $_backup_tmp.tgz
	;;
	*)
		echo "This script only accepts operations 'prepare' and 'delete'"
	;;
esac
