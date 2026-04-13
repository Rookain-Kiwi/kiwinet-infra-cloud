# ─────────────────────────────────────────────
# variables.tf — kiwinet-infra-cloud
# Déclaration de toutes les variables du projet
# ─────────────────────────────────────────────

# ── Authentification Scaleway ─────────────────

variable "scw_access_key" {
  description = "Clé d'accès Scaleway (SCW_ACCESS_KEY)"
  type        = string
  sensitive   = true
}

variable "scw_secret_key" {
  description = "Clé secrète Scaleway (SCW_SECRET_KEY)"
  type        = string
  sensitive   = true
}

variable "scw_project_id" {
  description = "Identifiant du projet Scaleway"
  type        = string
  sensitive   = true
}

# ── Localisation ──────────────────────────────

variable "scw_region" {
  description = "Région Scaleway"
  type        = string
  default     = "fr-par"
}

variable "scw_zone" {
  description = "Zone Scaleway"
  type        = string
  default     = "fr-par-1"
}

# ── Instance ──────────────────────────────────

variable "instance_type" {
  description = "Type d'instance Scaleway"
  type        = string
  default     = "STARDUST1-S"
}

variable "instance_image" {
  description = "Image OS de l'instance"
  type        = string
  default     = "debian_bookworm"
}

variable "instance_name" {
  description = "Nom de l'instance"
  type        = string
  default     = "kiwinet-web"
}

# ── SSH ───────────────────────────────────────

variable "ssh_public_key" {
  description = "Clé publique SSH pour l'accès à l'instance (kiwinet_deploy.pub)"
  type        = string
  sensitive   = true
}

variable "ssh_port" {
  description = "Port SSH non-standard (hardening)"
  type        = number
  default     = 2222
}