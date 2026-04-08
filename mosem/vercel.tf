import {
  to = vercel_project.mosem
  id = "prj_Hv8AjqdM41DMFLYKOJeUfy6vlm4G"
}

import {
  to = vercel_project_domain.www_aynu_io
  id = "prj_Hv8AjqdM41DMFLYKOJeUfy6vlm4G/www.aynu.io"
}

import {
  to = vercel_project_domain.aynu_io
  id = "prj_Hv8AjqdM41DMFLYKOJeUfy6vlm4G/aynu.io"
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
