provider "google" {
  credentials = file("/opt/key/terraform-sa.json")
  project     = var.project_id
  region      = var.region
}

resource "google_project_service" "core_apis" {
  project = var.project_id
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "artifactregistry.googleapis.com",
  ])
  service             = each.key
  disable_on_destroy  = false
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

module "iam" {
  source = "./modules/iam"
  project_id = var.project_id
}

resource "google_artifact_registry_repository" "nodejs_repo" {
  location      = var.region
  repository_id = var.repo_id
  description   = var.repo_description
  format        = "DOCKER"

}