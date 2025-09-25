variable "docker_host" {
  description = "Docker host URI"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

variable "container_name" {
  type    = string
  default = "tf-nginx"
}

variable "image" {
  type    = string
  default = "nginx:latest"
}

variable "external_port" {
  type    = number
  default = 8080
}

variable "env_vars" {
  type      = list(string)
  default   = []
  sensitive = true
}
