import {
  to = cloudflare_dns_record.neet_love
  id = "59201401f72067735dde2e19182acb26/44ec9ea36234844b7d52432d270f57b2"
}

import {
  to = cloudflare_dns_record.www_neet_love
  id = "59201401f72067735dde2e19182acb26/be4530f9757a3eb83143387bc3edddf9"
}

import {
  to = cloudflare_dns_record.neet_love_keybase
  id = "59201401f72067735dde2e19182acb26/26c53bccd5457ff1dfe3ee00cee81afa"
}

import {
  to = cloudflare_dns_record.neet_love_google
  id = "59201401f72067735dde2e19182acb26/d019900baaf1d4eb10eac6ecbfcb975e"
}

resource "cloudflare_dns_record" "neet_love" {
  zone_id = "59201401f72067735dde2e19182acb26"
  name    = "neet.love"
  content = "76.76.21.21"
  type    = "A"
  ttl     = 1
  proxied = false 
}

resource "cloudflare_dns_record" "www_neet_love" {
  zone_id = "59201401f72067735dde2e19182acb26"
  name    = "www"
  content = "cname.vercel-dns.com"
  type    = "CNAME"
  ttl     = 1
  proxied = false 
}

resource "cloudflare_dns_record" "neet_love_keybase" {
  zone_id = "59201401f72067735dde2e19182acb26"
  name    = "neet.love"
  content = "\"keybase-site-verification=QhltmSuxdrvX-oErcymiYBhv5X6Y6fBo0MuriDX5e6o\""
  type    = "TXT"
  ttl     = 1
  proxied = false 
}

resource "cloudflare_dns_record" "neet_love_google" {
  zone_id = "59201401f72067735dde2e19182acb26"
  name    = "neet.love"
  content = "\"google-site-verification=nLBvfC-KzCoRKONVHxLEDCO0Q7n_F818dzRWJSVy89I\""
  type    = "TXT"
  ttl     = 1
  proxied = false 
}
