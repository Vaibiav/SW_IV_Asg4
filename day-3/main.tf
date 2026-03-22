terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.2"
    }
  }
}

provider "null" {}

resource "null_resource" "docker_container" {
  provisioner "local-exec" {
    command = "docker run -d -p 8080:80 --name my-nginx nginx"
  }
}

output "container_url" {
  value = "http://localhost:8080"
}