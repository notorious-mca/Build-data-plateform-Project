terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.40.0"
    }
  }
}

// Configure the Google Cloud Provider
provider "google" {
  project = var.GOOGLE_CLOUD_PROJECT       #gcp-project-id
  region  = "us"                #gcp-region (us-asia-eu)
}