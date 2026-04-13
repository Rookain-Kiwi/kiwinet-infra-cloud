# ─────────────────────────────────────────────
# network.tf — kiwinet-infra-cloud
# Réseau privé et IP publique flexible
# ─────────────────────────────────────────────

# ── IP publique flexible ──────────────────────
# Flexible = persiste indépendamment de l'instance
# Permet de recréer l'instance sans changer l'IP publique

resource "scaleway_instance_ip" "public" {
  project_id = var.scw_project_id
}

# ── Réseau privé ──────────────────────────────
# Isolation réseau entre les ressources Scaleway du projet

resource "scaleway_vpc_private_network" "kiwinet" {
  name       = "kiwinet-network"
  project_id = var.scw_project_id
}