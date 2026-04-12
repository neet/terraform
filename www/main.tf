terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = ">= 5.8.2"
    }

    vercel = {
      source = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

import {
  to = vercel_project.www
  id = "prj_pcbXyXnRa5rFJMi9Uo7MW8BEKml6"
}

import {
  to = vercel_project_domain.neet_love
  id = "prj_pcbXyXnRa5rFJMi9Uo7MW8BEKml6/neet.love"
}

import {
  to = vercel_project_domain.www_neet_love
  id = "prj_pcbXyXnRa5rFJMi9Uo7MW8BEKml6/www.neet.love"
}

import {
  to = cloudflare_dns_record.a_neet_love
  id = "59201401f72067735dde2e19182acb26/44ec9ea36234844b7d52432d270f57b2"
}

import {
  to = cloudflare_dns_record.cname_www_neet_love
  id = "59201401f72067735dde2e19182acb26/be4530f9757a3eb83143387bc3edddf9"
}

import {
  to = cloudflare_dns_record.txt_neet_love_keybase
  id = "59201401f72067735dde2e19182acb26/26c53bccd5457ff1dfe3ee00cee81afa"
}

import {
  to = cloudflare_dns_record.txt_neet_love_google
  id = "59201401f72067735dde2e19182acb26/d019900baaf1d4eb10eac6ecbfcb975e"
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
  project_id = vercel_project.love.id
  domain     = "neet.love"
}

resource "vercel_project_domain" "www_neet_love" {
  project_id = vercel_project.love.id
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

