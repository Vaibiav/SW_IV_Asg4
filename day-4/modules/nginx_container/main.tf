variable "container_name" {
  type = string
}

variable "container_port" {
  type = number
}

resource "null_resource" "nginx" {
  provisioner "local-exec" {
    command = "docker run -d -p ${var.container_port}:80 --name ${var.container_name} nginx"
  }
}