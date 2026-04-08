import {
  to = cloudflare_dns_record.aynu_io
  id = "7b42f86a86701ddbccaac476cabfa6fa/4879d09cae146a8631a981384f770183"
}

import {
  to = cloudflare_dns_record.www_aynu_io
  id = "7b42f86a86701ddbccaac476cabfa6fa/6cb06f82912f5974f73495f9e6ed6691"
}

resource "cloudflare_dns_record" "aynu_io" {
  zone_id = "7b42f86a86701ddbccaac476cabfa6fa"
  name    = "aynu.io"
  content = "216.198.79.1"
  type    = "A"
  ttl     = 1
  proxied = false 
}

resource "cloudflare_dns_record" "www_aynu_io" {
  zone_id = "7b42f86a86701ddbccaac476cabfa6fa"
  name    = "www"
  content = "96811a0b124c3be5.vercel-dns-017.com"
  type    = "CNAME"
  ttl     = 1
  proxied = false 
}
