variable "render_api_key" {
  type        = string
  description = "Clé API Render pour l'authentification"
  sensitive   = true
}

variable "owner_id" {
  type        = string
  description = "ID du propriétaire/workspace sur Render"
  default     = ""
}