#!/bin/bash

# Exit in case of any error
set -e
trap 'logger -s -t headscale-backup "Fatal error at line $LINENO, refusing to run any more commands"' ERR

if [[ $UID != 0 ]]; then
    echo "This script must be run as root or using sudo"
    exit 1;
fi

[[ -n $2 && $2 != "/" ]] || { echo "Usage: $0 prepare|delete <path>"; exit 1; }

# Variables
_backup_tmp=$2

case $1 in
    prepare)
        umask 077
        mkdir -p "$_backup_tmp"
        chmod 0700 "$_backup_tmp"
        cp -a /etc/headscale "$_backup_tmp/etc-headscale"
        cp -a /var/lib/headscale "$_backup_tmp/var-lib-headscale"
        rm -f "$_backup_tmp/var-lib-headscale/db.sqlite-wal" "$_backup_tmp/var-lib-headscale/db.sqlite-shm"
        sqlite3 /var/lib/headscale/db.sqlite ".backup '$_backup_tmp/var-lib-headscale/db.sqlite'"
        tar -czf "$_backup_tmp.tgz" -C "$(dirname "$_backup_tmp")" "$(basename "$_backup_tmp")"
        ;;
    delete)
        rm -rf "$_backup_tmp"
        rm -f "$_backup_tmp.tgz"
        ;;
    *)
        echo "This script only accepts operations 'prepare' and 'delete'"
        exit 1
        ;;
esac
