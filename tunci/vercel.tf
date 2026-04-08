import {
  to = vercel_project.tunci
  id = "prj_98xNr72TyzlxWIsUCTYlj0HZQzTP"
}

import {
  to = vercel_project_domain.tunci_aynu_io
  id = "prj_98xNr72TyzlxWIsUCTYlj0HZQzTP/tunci.aynu.io"
}

resource "vercel_project" "tunci" {
  name      = "tunci"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "aynumosir/tunci"
  }
}

resource "vercel_project_domain" "tunci_aynu_io" {
  project_id = vercel_project.tunci.id
  domain     = "tunci.aynu.io"
}

