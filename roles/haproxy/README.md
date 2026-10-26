# haproxy

This role deploys and configures HAProxy for use as a HTTPS reverse proxy. It uses [Certbot](https://certbot.eff.org) for [Let's Encrypt](https://letsencrypt.org) (automatically manages certificates) and assumes the use of [Cloudflare](https://www.cloudflare.com/domains/) as the DNS provider, as well as [CrowdSec](https://docs.crowdsec.net/u/bouncers/haproxy_spoa/) for security. If using this role, run the crowdsec role beforehand to configure those prerequisites.

It also deploys these utilities for managing the installation:
- haproxycli: honestly AI-generated script for interacting with the HAProxy socket, does the job just fine
- certbot-helper: script used for issuing new certificates, used by the role to automatically issue them, but feel free to use it manually
