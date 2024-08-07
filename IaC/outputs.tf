output "Bucket_URL" {
    value = google_storage_bucket.data_platform_bucket.url
}

output "Bucket_URI" {
    value = google_storage_bucket.data_platform_bucket.self_link
}