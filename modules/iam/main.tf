locals {
  cicd_project_roles = [
    "roles/artifactregistry.writer", 
    "roles/run.admin",
    "roles/iam.serviceAccountUser"              
  ]
}

resource "google_service_account" "githubactions_sa" {
  account_id   = var.account_id
  display_name = var.display_name
}

resource "google_project_iam_member" "cicd_project_roles" {
  for_each = toset(local.cicd_project_roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.githubactions_sa.email}"
}

resource "google_service_account_key" "githubactions_sa_key" {
  service_account_id = google_service_account.githubactions_sa.name
}