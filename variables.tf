variable "region" {
  description = "Location where resourse is to be provisioned"
  type = string
  default = "EU"
}

variable "project_id" {
  description = "GCP project ID"
  type = string
  default = "mylearning-demo"
}