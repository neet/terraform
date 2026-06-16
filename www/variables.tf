variable "cloudflare_zone_id" {
  type        = string
  description = "CloudflareのZone ID（ドメインに対して割り当てられているID）"
}

variable "microcms_service_domain" {
  type        = string
  description = "MicroCMSのサービスドメイン"
}

variable "microcms_api_key" {
  type        = string
  description = "MicroCMSのAPIキー"
  sensitive   = true
}

