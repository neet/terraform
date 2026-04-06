terraform {
  required_providers {
    vercel = {
      source = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

resource "vercel_project" "mosem" {
  name      = "mosem"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "aynumosir/mosem"
  }
}

resource "vercel_project_domain" "www_aynu_io" {
  project_id = vercel_project.mosem.id
  domain     = "www.aynu.io"
}

resource "vercel_project_domain" "aynu_io" {
  project_id = vercel_project.mosem.id
  domain     = "aynu.io"
  redirect   = "www.aynu.io"
}
