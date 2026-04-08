import {
  to = vercel_project.love
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

resource "vercel_project" "love" {
  name      = "neet-love"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "neet/neet.love"
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
