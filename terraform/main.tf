terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# 1. Télécharger l'image Nginx
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = false
}

# 2. Lancer un conteneur Nginx
resource "docker_container" "nginx_web" {
  image = docker_image.nginx.image_id
  name  = "demo-terraform-nginx"

  ports {
    internal = 80
    external = 8081
  }
}

# 3. Afficher l'URL d'accès
output "web_url" {
  value       = "http://localhost:8081"
  description = "URL d'accès au serveur Nginx"
}