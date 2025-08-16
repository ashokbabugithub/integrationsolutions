variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "zone" {
  description = "GCP Zone for VM"
  type        = string
  default     = "australia-southeast1-b"
}

variable "machine_type" {
  description = "Machine type for VM"
  type        = string
  default     = "e2-small"
}

variable "tags" {
  description = "Map of tags to apply to VM and disks"
  type        = map(string)
  default = {
    environment    = "dev"
    application    = "gcp-vm-creation"
    billing_number = "12345"
  }
}

variable "startup_script" {
  description = "Startup script for VM"
  type        = string
  default     = <<-EOT
    #! /bin/bash
    echo "Hello from Terraform VM" > /var/tmp/hello.txt
  EOT
}
