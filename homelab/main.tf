terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = ">= 5.8.2"
    }

    vercel = {
      source = "vercel/vercel"
      version = ">= 4.7.1"
    }
  }

  backend "remote" {
    hostname = "app.terraform.io"
    organization = "neetlab"

    workspaces {
      name = "homelab"
    }
  }
}

data "cloudflare_zero_trust_tunnel_cloudflared" "mitaka" {
  account_id = var.cloudflare_account_id 
  tunnel_id  = var.cloudflare_tunnel_id
}

resource "cloudflare_dns_record" "immich_neet_love" {
  zone_id = var.cloudflare_zone_id
  name    = "immich"
  content = "${data.cloudflare_zero_trust_tunnel_cloudflared.mitaka.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true 
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "mitaka" {
  tunnel_id  = data.cloudflare_zero_trust_tunnel_cloudflared.mitaka.id
  account_id = var.cloudflare_account_id 
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
