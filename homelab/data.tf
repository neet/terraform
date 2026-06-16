data "cloudflare_zero_trust_tunnel_cloudflared" "this" {
  account_id = var.cloudflare_account_id 
  tunnel_id  = var.cloudflare_tunnel_id
}

