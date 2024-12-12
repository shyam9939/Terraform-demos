# main.tf
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}
# Example: Create a Google Compute Engine instance
resource "google_compute_instance" "example_instance" {
  name         = "example-instance"
  machine_type = "e2-medium"
  zone         = "${var.region}-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
      # Ephemeral IP
    }
  }
  labels = {
    environment = "development"
    managed_by  = "terraform"
  }
}
# variables.tf
variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
  default     = "shyamkprj"
}
variable "region" {
  description = "The GCP region for resources"
  type        = string
  default     = "us-central1"
}
