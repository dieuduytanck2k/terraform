# 1. Create a Service Account for Terraform

```conf
gcloud iam service-accounts create terraform-sa --description="Service Account for Terraform" --display-name="terraform-sa"
```

# 2. Grant the necessary roles for Service Account 

```conf
gcloud projects add-iam-policy-binding devops-467006 --member="serviceAccount:terraform-sa@devops-467006.iam.gserviceaccount.com" --role="roles/storage.admin" --role="roles/resourcemanager.projectIamAdmin" --role="roles/iam.serviceAccountAdmin" --role="roles/artifactregistry.admin" --role="roles/serviceusage.serviceUsageAdmin" --role="roles/iam.serviceAccountKeyAdmin"
```

- `roles/storage.admin` – manage GCS buckets and objects (for remote state).  
- `roles/resourcemanager.projectIamAdmin` – manage IAM policy at project level.  
- `roles/iam.serviceAccountAdmin` – create and manage service accounts.  
- `roles/artifactregistry.admin` – manage Artifact Registry repositories and images.  
- `roles/serviceusage.serviceUsageAdmin` – enable and manage GCP services (APIs).  
- `roles/iam.serviceAccountKeyAdmin` – create and manage service account keys.

# 3. Create workspace for Terraform

```conf
terraform workspace new prod
```

# 4. Create a GCS Bucket for Terraform State

You can see this configuration in the `main.tf` file.

<img src="./image/gcs.png" alt="Bucket for Statefile" width="300"/>

# 5. Migrate statefile from local to GCS

```config
terraformm init -reconfig
```

You can see this configuration in the `terraform.tf` file.

<img src="./image/bucket-statefile.png" alt="Bucket for Statefile" width="300"/>
