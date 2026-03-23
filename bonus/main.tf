variable "container_config" {
  type = list(object({
    name = string
    port = number
  }))
}

locals {
  containers = var.container_config
}

resource "null_resource" "nginx" {
  for_each = {
    for c in local.containers : c.name => c
  }

  provisioner "local-exec" {
    command = "docker run -d -p ${each.value.port}:80 --name ${each.value.name} nginx"
  }
}

output "container_urls" {
  value = [
    for c in local.containers :
    "http://localhost:${c.port}"
  ]
}