# cloudflare_ddns

This role configures a Docker container (made by [favonia](https://github.com/favonia/cloudflare-ddns)) to run DDNS updates in Cloudflare's domain settings for dynamic IP setups (which is most homelabs).

I recommend using [CNAME records](https://www.cloudflare.com/learning/dns/dns-records/dns-cname-record/) to avoid needing to update this project's configuration every time a new subdomain is added.
