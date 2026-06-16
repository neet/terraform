resource "cloudflare_dns_record" "a_neet_love" {
  zone_id = var.cloudflare_zone_id
  name    = "neet.love"
  content = "76.76.21.21"
  type    = "A"
  ttl     = 1
  proxied = false 
}

resource "cloudflare_dns_record" "cname_www_neet_love" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  content = "cname.vercel-dns.com"
  type    = "CNAME"
  ttl     = 1
  proxied = false 
}

resource "cloudflare_dns_record" "txt_neet_love_keybase" {
  zone_id = var.cloudflare_zone_id
  name    = "neet.love"
  content = "\"keybase-site-verification=QhltmSuxdrvX-oErcymiYBhv5X6Y6fBo0MuriDX5e6o\""
  type    = "TXT"
  ttl     = 1
  proxied = false 
}

resource "cloudflare_dns_record" "txt_neet_love_google" {
  zone_id = var.cloudflare_zone_id
  name    = "neet.love"
  content = "\"google-site-verification=nLBvfC-KzCoRKONVHxLEDCO0Q7n_F818dzRWJSVy89I\""
  type    = "TXT"
  ttl     = 1
  proxied = false 
}

