import {
  to = cloudflare_dns_record.kampisos_aynu_io
  id = "7b42f86a86701ddbccaac476cabfa6fa/c0b07077e5b94e2f469cca09f7734d92"
}

resource "cloudflare_dns_record" "kampisos_aynu_io" {
  zone_id = "7b42f86a86701ddbccaac476cabfa6fa"
  name    = "kampisos"
  content = "8b00208f3a81a61c.vercel-dns-017.com"
  type    = "CNAME"
  ttl     = 1
  proxied = false 
}

