variable "project_id" {
  description = "project"
  default     = "devops-467006"
}

variable "region" {
  description = "region"
  default     = "asia-southeast1"
}

variable "bucket_name_tf" {
  description = "bucket name"
  default     = "terraform-tf-speedforce-demo-nodejs-2025"
}

variable "repo_id" {
  description = "Artifact registry"
  type        = string
  default     = "nodejs-images"
}

variable "repo_description" {
  description = "Description repo"
  type        = string
  default     = "Container images for nodejs app"
}