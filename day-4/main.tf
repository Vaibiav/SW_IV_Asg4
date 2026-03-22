module "nginx1" {
  source = "./modules/nginx_container"

  container_name = "nginx1"
  container_port = 8081
}

module "nginx2" {
  source = "./modules/nginx_container"

  container_name = "nginx2"
  container_port = 8082
}