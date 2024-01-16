output "img_link1" {
  value = google_storage_bucket_object.img1.self_link
}

output "img_link2" {
  value = google_storage_bucket_object.img1.media_link
}