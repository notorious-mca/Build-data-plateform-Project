resource "google_storage_bucket" "data_platform_bucket" {
  name          = var.GCS_BUCKET_NAME
  location      = var.GCS_BUCKET_LOCATION
  force_destroy = true      // When deleting a bucket, this boolean option will delete all contained objects

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }
}