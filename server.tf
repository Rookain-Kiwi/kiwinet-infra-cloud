# ─────────────────────────────────────────────
# server.tf — kiwinet-infra-cloud
# Instance Scaleway STARDUST1-S et clé SSH
# ─────────────────────────────────────────────

# ── Clé SSH ───────────────────────────────────
# Clé kiwinet_deploy — partagée avec kiwinet-infra-vm

resource "scaleway_account_ssh_key" "kiwinet_deploy" {
  name       = "kiwinet_deploy"
  public_key = var.ssh_public_key
  project_id = var.scw_project_id
}

# ── Instance ──────────────────────────────────

resource "scaleway_instance_server" "kiwinet_web" {
  name              = var.instance_name
  type              = var.instance_type
  image             = var.instance_image
  project_id        = var.scw_project_id
  security_group_id = scaleway_instance_security_group.kiwinet_web.id
  ip_id             = scaleway_instance_ip.public.id

  user_data = {
    cloud-init = templatefile("${path.module}/cloud-init.yml", {
      ssh_public_key = var.ssh_public_key
    })
  }

  tags = ["kiwinet", "web", "terraform"]
}