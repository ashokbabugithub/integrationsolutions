project_id   = "qwiklabs-gcp-00-f730a15ab09d"
zone         = "australia-southeast1-b"
machine_type = "e2-small"

tags = {
  environment    = "prod"
  application    = "webserver"
  billing_number = "67890"
  owner          = "ashok"
}

startup_script = <<-EOT
  #! /bin/bash
  echo "Hello from PROD VM" > /var/tmp/hello.txt
EOT

