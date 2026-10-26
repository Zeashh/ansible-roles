# proxmox_templates

This role configures [Proxmox](https://www.proxmox.com) Linux VM and LXC templates in a declarative manner, making updates easier (e.g Debian 12 -> 13, my real use case).

VMs are deployed using cloud images, or other fetchable disk images, while LXCs are created from Proxmox's official templates.

This role should be used in tandem with other roles/playbooks to achieve automatic template configuration (in my case, the common_config role).
