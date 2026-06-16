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

  cloud {
    organization = "neetlab"

    workspaces {
      name = "homelab"
    }
  }
}

