terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "terraform-tf-speedforce-demo-nodejs-2025"
    prefix = "env/prod"
  }
}