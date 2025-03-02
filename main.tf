terraform {
  backend "gcs" {
    bucket = "rfx-us-cl101pr-lvs-121260099-fs1"
    prefix = "LVS-from-PR/atlantis"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.40.0"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
}

resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = "e2-micro"
  
  zone         = var.zone
  tags = ["dev", "engineering"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20221014"
      labels = {
        env = "dev"
      }
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
}

resource "google_storage_bucket" "auto-expire" {
  project       = var.project
  name          = "no-public-access-bucket"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}

