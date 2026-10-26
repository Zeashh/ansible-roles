# wireguard

This role configures [Linuxserver's Wireguard Docker container](https://docs.linuxserver.io/images/docker-wireguard) on 2 hosts, with a config sync cronjob configured on one.

In tandem with keepalived, this allows for a highly-available setup in the event that one Wireguard host fails.
