resource "cloudflare_dns_record" "immich_neet_love" {
  zone_id = var.cloudflare_zone_id
  name    = "immich"
  content = "${data.cloudflare_zero_trust_tunnel_cloudflared.this.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true 
}

resource "cloudflare_dns_record" "elasticsearch_neet_love" {
  zone_id = var.cloudflare_zone_id
  name    = "elasticsearch"
  content = "${data.cloudflare_zero_trust_tunnel_cloudflared.this.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true 
}

resource "cloudflare_dns_record" "open_webui_neet_love" {
  zone_id = var.cloudflare_zone_id
  name    = "open-webui"
  content = "${data.cloudflare_zero_trust_tunnel_cloudflared.this.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "this" {
  tunnel_id  = data.cloudflare_zero_trust_tunnel_cloudflared.this.id
  account_id = var.cloudflare_account_id 
  config = {
    ingress = [
      {
        hostname       = "immich.neet.love"
        origin_request = {}
        service        = "http://localhost:2283"
      },
      {
        hostname       = "elasticsearch.neet.love"
        origin_request = {}
        service        = "http://localhost:9200"
      },
      {
        hostname       = "open-webui.neet.love"
        origin_request = {}
        service        = "http://192.168.11.3:3000"
      },
      {
        service = "http_status:404"
      }
    ]
  }
}

