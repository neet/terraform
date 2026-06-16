variable "cloudflare_zone_id" {
  type        = string
  description = "CloudflareのZone ID（ドメインに対して割り当てられているID）"
}

variable "cloudflare_account_id" {
  type        = string
  description = "CloudflareのAccount ID"
}

variable "cloudflare_tunnel_id" {
  type        = string
  description = "CloudflareのTunnel ID"
}

