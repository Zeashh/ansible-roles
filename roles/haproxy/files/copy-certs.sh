#!/bin/bash

exec 1> >(logger -s -t $(basename $0)) 2>&1

if [[ $UID != 0 ]]; then
	echo This script must be run as root!
	exit 1
fi

cert_tmp_dir=/root/tmp/old_haproxy_certs
cert_destination_dir=/etc/haproxy/certificates

mkdir -p $cert_tmp_dir
mv $cert_destination_dir/* $cert_tmp_dir/

cd /etc/letsencrypt/live
for cert in $(ls | grep -v 'README')
do
    cat $cert/fullchain.pem $cert/privkey.pem > $cert_destination_dir/$cert.pem
done

systemctl reload haproxy

if [[ $? == 0 ]]; then
	rm -rf $cert_tmp_dir/
fi