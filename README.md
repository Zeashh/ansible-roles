# Ansible Collection - grghomelab.roles

> [!attention]
Take into consideration that this project isn't meant to be a one-size-fits-all homelab swiss-tool. It's *my* swiss tool 🙃.

This is a highly opinionated collection of various Ansible roles I use to make administration of my homelab easier.

To use them, check out the [ansible-playbooks](https://github.com/Zeashh/ansible-playbooks) project.

There are many assumptions I've made about the infrastructure while wiring these up:
- The simplest network possible (single subnet IPv4)
- Almost or entirely limited to Debian 13 Linux installations
- [Proxmox VE](https://www.proxmox.com/en/products/proxmox-virtual-environment/overview) with VMs and LXCs, [PBS](https://www.proxmox.com/en/products/proxmox-backup-server/overview) for backups, a cloud instance for [Headscale](https://github.com/juanfont/headscale), and nothing else
- A **pair** of 'edge' hosts, which serve DNS, DHCP, HAProxy, and much more... (check out [ansible-playbooks](https://github.com/Zeashh/ansible-playbooks))
- A public Headscale cloud instance
...and much more

Thus, if you decide to use them, you'll have to accept architectural decisions I've made for myself, or fork them and adjust to your will.

If you wish to see them expanded, create an issue / pull request, or send me an e-mail at [inbox@grghomelab.me](mailto:inbox@grghomelab.me).
