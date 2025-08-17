variable "project_id" {
  type = string
}

variable "zone" {
  type    = string
  default = "us-west1-b"
}

variable "machine_type" {
  type    = string
  default = "e2-small"
}

variable "tags" {
  type = map(string)
  default = {
    environment      = "dev"
    application_name = "connectdirect"
    billing_number   = "12345"
  }
}

variable "ssl_cert_remote_path" {
  type    = string
  default = "/app/connectdirect/ndm/secure+/certificates"
}

variable "ssl_cert_secrets" {
  type = map(string)
  default = {
    "app_cert.pem"   = "connectdirect-app-cert"
    "app_key.pem"    = "connectdirect-app-key"
    "ca_bundle.crt"  = "connectdirect-ca-bundle"
  }
}

variable "credentials_file" {
  type = string
  default = "path/to/service-account.json"
}
