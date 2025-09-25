terraform {
  required_version = ">= 1.0.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginx" {
  name = var.image
}

resource "docker_container" "nginx" {
  name    = var.container_name
  image   = docker_image.nginx.name     # ✅ correct attribute
  restart = "unless-stopped"

 ports {
    internal = 80       # container port (default for Nginx)
    external = 8082     # host port
  }


  env = var.env_vars
}
