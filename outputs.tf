# ─────────────────────────────────────────────
# outputs.tf — kiwinet-infra-cloud
# Valeurs exportées après terraform apply
# Décommenté au ticket #4 une fois les ressources déclarées
# ─────────────────────────────────────────────

# output "instance_public_ip" {
#   description = "IP publique du VPS Scaleway — à renseigner dans Bluehost (enregistrement A) et GitHub Secrets (DEPLOY_HOST)"
#   value       = scaleway_instance_ip.public.address
# }

# output "instance_id" {
#   description = "Identifiant de l'instance Scaleway"
#   value       = scaleway_instance_server.kiwinet_web.id
# }