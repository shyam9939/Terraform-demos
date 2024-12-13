terraform {
  backend "gcs" {
    bucket  = "bucket-for-tfstate-file"
    prefix  = "terraform1/state"
  }
}
