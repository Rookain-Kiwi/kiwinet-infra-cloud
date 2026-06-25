# ============================================================================
# kiwinet-infra-cloud/storage.tf
# Block Storage — 50 Go (actuellement pour PostgreSQL, extensible à d'autres)
# Documentation: https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/block_volume
# ============================================================================

resource "scaleway_block_volume" "data" {
  name       = "kiwinet-data"
  size_in_gb = 50
  iops       = 5000
  zone       = var.scw_zone
  tags       = ["database", "storage"]

  lifecycle {
    prevent_destroy = true
  }
}
