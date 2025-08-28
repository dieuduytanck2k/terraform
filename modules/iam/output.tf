output "google_service_account_account_id" {
  value = google_service_account.githubactions_sa.account_id
}

output "google_service_account_account_email" {
  value = google_service_account.githubactions_sa.email
}

output "google_service_account_display_name" {
  value = google_service_account.githubactions_sa.display_name
}

output "githubactions_sa_private_key" {
  value     = google_service_account_key.githubactions_sa_key.private_key
  sensitive = true
}