output "service_url" {
  value       = render_web_service.app.url
  description = "URL publique du service déployé via Terraform"
}