# render SVM template
docs_path <- here::here("my-document")

dir.create(docs_path)

fs::file_copy(
  system.file("rmarkdown",
              "templates",
              "resume",
              "skeleton",
              "skeleton.Rmd",
              package = "stevetemplates"),
  docs_path
)

# Simple pdf file
skeleton <- glue::glue('
---
title: "My document"
output:
  pdf_document: default
---

Introduction
---

Some highly informative text.

')

cat(skeleton, file = here::here("my-document", "my-document.Rmd"))

# create yaml file
usethis::use_github_action("render-rmarkdown.yaml")

# rename to render a generic doc
fs::file_move(
  here::here(".github/workflows/render-rmarkdown.yaml"),
  here::here(".github/workflows/render-doc.yaml")
)

usethis::edit_file('.github/workflows/render-doc.yaml')
