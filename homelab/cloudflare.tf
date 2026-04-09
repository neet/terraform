import {
  to = cloudflare_dns_record.immich_neet_love
  id = "59201401f72067735dde2e19182acb26/e65dc1987c2ef0f17fc0620eb0c15241"
}

import {
  to = cloudflare_zero_trust_tunnel_cloudflared_config.mitaka
  id = "76d224284e40fc0bb85d8b8e39e6d652/6af47c59-63a6-4953-912e-f751f761a95e"
}

data "cloudflare_zero_trust_tunnel_cloudflared" "mitaka" {
  account_id = "76d224284e40fc0bb85d8b8e39e6d652"
  tunnel_id  = "6af47c59-63a6-4953-912e-f751f761a95e"
}

resource "cloudflare_dns_record" "immich_neet_love" {
  zone_id = "59201401f72067735dde2e19182acb26"
  name    = "immich"
  content = "${data.cloudflare_zero_trust_tunnel_cloudflared.mitaka.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true 
}


resource "cloudflare_zero_trust_tunnel_cloudflared_config" "mitaka" {
  tunnel_id = data.cloudflare_zero_trust_tunnel_cloudflared.mitaka.id
  account_id = "76d224284e40fc0bb85d8b8e39e6d652"
  config = {
    ingress = [
      {
        hostname       = "immich.neet.love"
        origin_request = {}
        service        = "http://localhost:2283"
      },
      {
        service = "http_status:404"
      }
    ]
  }
}
