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
      name = "www"
    }
  }
}

resource "vercel_project" "www" {
  name      = "www"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "neet/www"
  }
}

resource "vercel_project_domain" "neet_love" {
  project_id = vercel_project.www.id
  domain     = "neet.love"
}

resource "vercel_project_domain" "www_neet_love" {
  project_id = vercel_project.www.id
  domain     = "www.neet.love"
  redirect   = "neet.love"
  redirect_status_code = 308
}

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

resource "vercel_project_environment_variable" "microcms_service_domain" {
  project_id = vercel_project.www.id
  key        = "SERVICE_DOMAIN"
  value      = var.microcms_service_domain
  target     = ["production", "preview", "development"]
}

resource "vercel_project_environment_variable" "microcms_api_key" {
  project_id = vercel_project.www.id
  key        = "API_KEY"
  value      = var.microcms_api_key
  target     = ["production", "preview"]
  sensitive  = true
}

