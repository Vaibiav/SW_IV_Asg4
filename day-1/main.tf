terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "local" {}

# Variable
variable "message" {
  description = "Message to write in file"
  type        = string
  default     = "Hello from Terraform"
}

# Resource
resource "local_file" "hello" {
  filename = "hello.txt"
  content  = var.message
}

# Output
output "file_path" {
  value = local_file.hello.filename
}