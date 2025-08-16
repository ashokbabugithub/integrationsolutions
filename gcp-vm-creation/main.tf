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
  region  = substr(var.zone, 0, length(var.zone) - 2) # extract region from zone
}

resource "google_compute_instance" "vm" {
  name         = "tf-vm"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
    # Disk labels
    labels = var.tags
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  # VM instance labels
  labels = var.tags

  metadata_startup_script = var.startup_script
}

output "vm_external_ip" {
  value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}

