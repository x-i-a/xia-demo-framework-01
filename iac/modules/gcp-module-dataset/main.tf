locals {
  contents         = yamldecode(file(var.content))
}

resource "google_bigquery_dataset" "sample_dataset" {
  dataset_id          = local.contents.dataset_id
  description         = local.contents.description
  friendly_name       = local.contents.friendly_name
  location            = local.contents.location
  deletion_protection = local.contents.deletion_protection
}

