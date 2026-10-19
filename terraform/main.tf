terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.3.0"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.owner_id
}

# Déclaration d'un Web Service Docker sur Render
resource "render_web_service" "app" {
  name   = "devops-learning-iac"
  region = "frankfurt"
  plan   = "free"

  runtime_source = {
    image = {
      image_url = "ghcr.io/youssou123/devops-learning"
      tag       = "latest"
    }
  }

  env_vars = {
    "NODE_ENV" = {
      value = "production"
    }
  }
}