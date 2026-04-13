# ─────────────────────────────────────────────
# firewall.tf — kiwinet-infra-cloud
# Règles de sécurité réseau de l'instance
# ─────────────────────────────────────────────

resource "scaleway_instance_security_group" "kiwinet_web" {
  name                    = "kiwinet-web-sg"
  project_id              = var.scw_project_id
  inbound_default_policy  = "drop"   # Tout bloquer par défaut
  outbound_default_policy = "accept" # Trafic sortant libre

  # ── SSH non-standard (hardening) ─────────────
  inbound_rule {
    action   = "accept"
    port     = var.ssh_port
    protocol = "TCP"
  }

  # ── HTTP ─────────────────────────────────────
  inbound_rule {
    action   = "accept"
    port     = 80
    protocol = "TCP"
  }

  # ── HTTPS ────────────────────────────────────
  inbound_rule {
    action   = "accept"
    port     = 443
    protocol = "TCP"
  }

  # ── SSH standard (temporaire — accès initial) ─
  inbound_rule {
    action   = "accept"
    port     = 22
    protocol = "TCP"
  }
}