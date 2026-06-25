resource "vercel_project" "this" {
  name      = "www"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "neet/www"
  }
}

resource "vercel_project_domain" "neet_love" {
  project_id = vercel_project.this.id
  domain     = "neet.love"
}

resource "vercel_project_domain" "www_neet_love" {
  project_id = vercel_project.this.id
  domain     = "www.neet.love"
  redirect   = "neet.love"
  redirect_status_code = 308
}

resource "vercel_project_environment_variable" "microcms_service_domain" {
  project_id = vercel_project.this.id
  key        = "SERVICE_DOMAIN"
  value      = var.microcms_service_domain
  target     = ["production", "preview", "development"]
}

resource "vercel_project_environment_variable" "microcms_api_key" {
  project_id = vercel_project.this.id
  key        = "API_KEY"
  value      = var.microcms_api_key
  target     = ["production", "preview"]
  sensitive  = true
}

