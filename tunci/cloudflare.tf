import {
  to = cloudflare_dns_record.tunci_aynu_io
  id = "7b42f86a86701ddbccaac476cabfa6fa/56159609aa9386c6726a7f94a7d02dca"
}

resource "cloudflare_dns_record" "tunci_aynu_io" {
  zone_id = "7b42f86a86701ddbccaac476cabfa6fa"
  name    = "tunci"
  content = "23438773b0f10f29.vercel-dns-017.com"
  type    = "CNAME"
  ttl     = 1
  proxied = false 
}

