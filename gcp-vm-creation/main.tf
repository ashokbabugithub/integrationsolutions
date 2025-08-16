terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
  # Credentials will be picked up via ADC or GOOGLE_APPLICATION_CREDENTIALS
}

resource "google_compute_instance" "vm" {
  name         = "tf-vm"
  machine_type = "e2-small"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
    }
  }

  network_interface {
    network = "default"
    access_config {} # assign external IP
  }

  metadata_startup_script = <<-EOT
    #! /bin/bash
    echo "Hello from Terraform-provisioned VM" > /var/tmp/hello_tf.txt
  EOT
}
