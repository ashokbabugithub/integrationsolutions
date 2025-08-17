provider "google" {
  project     = var.project_id
  region      = substr(var.zone, 0, length(var.zone)-2)
  credentials = file(var.credentials_file)
}

resource "google_compute_instance" "vm" {
  name         = "tf-vm"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata_startup_script = file("connectdirect_installer.sh")

  labels = var.tags
}
