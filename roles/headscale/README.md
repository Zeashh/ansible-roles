# headscale

This role installs and configures [Headscale](https://github.com/juanfont/headscale) and backups on a separate machine (the jumphost).

The jumphost is set up to be able to SSH into the machineand it periodically pulls backups of the database and configuration in a tarball.

> [!note] 
> This role has an awkward built-in architecture because my homelab uses a Cloud VM to circumvent the dynamic IP I have at home, thus ensuring near 100% uptime on my Headscale deployment.
