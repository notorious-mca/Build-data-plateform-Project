variable "GCS_BUCKET_NAME" {
    type = string
    default = "data-platform-2024"
    description = "It is the name of the Google Cloud Storage Bucket which will be created"
}

variable "GCS_BUCKET_LOCATION" {
    type = string
    default = "US"
    description = "It is the location of the Google Cloud Storage Bucket which will be created"
}

variable "GOOGLE_CLOUD_PROJECT" {
    type = string
    description = "It is the GCP project ID where the Google Cloud Storage Bucket will be created"
}