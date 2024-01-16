resource "google_storage_bucket" "buck_tf_demo" {
  name = "buck_tf_demo"
  location = var.region
  project = var.project_id
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "webpage" {
  name = "hello"
  source = "hello.html"
  bucket = google_storage_bucket.buck_tf_demo.name
  depends_on = [ google_storage_bucket.buck_tf_demo ]
}

resource "google_storage_bucket_object" "img1" {
  name = "kitten"
  source = "kitten.jpg"
  bucket = google_storage_bucket.buck_tf_demo.name
  depends_on = [ google_storage_bucket.buck_tf_demo ]
}

# resource "google_bigquery_dataset" "demo_tf" {
#   dataset_id = "demo_tf"
#   location = var.region
#   default_table_expiration_ms = 3600000
#   project = var.project_id
# }

# resource "google_bigquery_table" "table_tf" {
#   dataset_id = google_bigquery_dataset.demo_tf.dataset_id
#   table_id = "table_tf"
#   project = var.project_id
#   deletion_protection = false
#   depends_on = [ google_bigquery_dataset.demo_tf ]
# }

# resource "google_bigquery_job" "job_tf" {
#   job_id = "job2"

#   query {
#     query = "select * from `bigquery-public-data.covid19_public_forecasts.japan_prefecture_28d` limit 1"

#     destination_table {
#       project_id = var.project_id
#       dataset_id = google_bigquery_table.table_tf.dataset_id
#       table_id   = google_bigquery_table.table_tf.table_id
#     }

#     allow_large_results = true
#     write_disposition = "WRITE_APPEND"
#   }

#   depends_on = [ google_bigquery_table.table_tf ]
# }