provider "google" {
  credentials = file("/opt/key/terraform-sa.json")
  project     = var.project_id
  region      = var.region
}

resource "google_storage_bucket" "tf_state" {
  name          = var.bucket_name_tf
  location      = "ASIA"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 90
    }
  }
}