output "google_storage_bucket" {
  value = google_storage_bucket.tf_state.name
}

output "google_service_account_account_id" {
  value = module.iam.google_service_account_account_id
}

output "google_service_account_account_email" {
  value = module.iam.google_service_account_account_email
}

output "google_service_account_display_name" {
  value = module.iam.google_service_account_display_name
}

output "google_artifact_registry_repository" {
  value = google_artifact_registry_repository.nodejs_repo.name
}

output "githubactions_sa_key_json" {
  value = module.iam.githubactions_sa_private_key
  sensitive = true
}