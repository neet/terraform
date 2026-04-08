import {
  to = vercel_project.kampisos
  id = "prj_vkC3QyumHZqksI5LUH2xjDSNSvFk"
}

import {
  to = vercel_project_domain.kampisos_aynu_io
  id = "prj_vkC3QyumHZqksI5LUH2xjDSNSvFk/kampisos.aynu.io"
}

resource "vercel_project" "kampisos" {
  name      = "kampisos"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = "aynumosir/kampisos"
  }
}

resource "vercel_project_domain" "kampisos_aynu_io" {
  project_id = vercel_project.kampisos.id
  domain     = "kampisos.aynu.io"
}

