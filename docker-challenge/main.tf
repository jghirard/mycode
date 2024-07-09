terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  # Configure your Docker provider settings here
}

resource "docker_image" "simplegoservice" {
  name = "registry.gitlab.com/alta3/simplegoservice"
  # Additional configuration for the image (e.g., tags, build arguments, etc.)
}
variable "internal_port" {
  type    = number
  default = 9876
}

variable "external_port" {
  type    = number
  default = 5432
}

variable "container_name" {
  type    = string
  default = "Alta3ResearchWebService"
}
resource "docker_container" "simplegoservice" {
  name  = var.container_name
  image = docker_image.simplegoservice.name

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  # Additional configuration for the container (e.g., environment variables, volumes, etc.)
}
