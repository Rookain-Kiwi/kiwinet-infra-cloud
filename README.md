# kiwinet-infra-cloud

Provisioning de l'infrastructure cloud du projet **Kiwinet** via Terraform.

Ce dépôt constitue la Phase 3 du projet Kiwinet : déploiement d'un VPS Scaleway
hébergeant le site [kiwinet.me](https://kiwinet.me), migré depuis la VM résidentielle
pour des raisons de performance et de disponibilité.

## Périmètre

- Provisioning d'une instance Scaleway STARDUST1-S (fr-par-1)
- Configuration réseau et firewall
- Hardening système via cloud-init (SSH non-standard, fail2ban, utilisateur dédié)
- Déploiement du container `kiwinet-web` (Nginx Alpine)

> Le DNS (Bluehost) et la CI/CD (GitHub Actions sur `kiwinet-web`) sont mis à jour
> manuellement en one-shot après provisioning. La procédure est documentée dans
> [`docs/migration.md`](docs/migration.md).

## Stack

| Outil | Rôle |
|---|---|
| Terraform | Provisioning infrastructure Scaleway |
| cloud-init | Bootstrap VM (hardening + Docker) |
| Scaleway | Hébergeur cloud (fr-par-1) |
| Docker | Runtime du container kiwinet-web |

## Dépôts liés

| Dépôt | Rôle |
|---|---|
| [`kiwinet-web`](https://github.com/Rookain-Kiwi/kiwinet-web) | Site Astro + CI/CD |
| [`kiwinet-infra-vm`](https://github.com/Rookain-Kiwi/kiwinet-infra-vm) | Ansible — VM Freebox Delta |
| [`kiwinet-docs`](https://github.com/Rookain-Kiwi/kiwinet-docs) | Documentation centrale et ADR |

## Utilisation

```bash
cp terraform.tfvars.example terraform.tfvars
# Renseigner les variables (clé API Scaleway, clé SSH)
terraform init
terraform plan
terraform apply
```

## Workflow Git

Ce dépôt suit le modèle **Git Flow** :
`feature/*` → PR → `develop` → PR → `main` (après `terraform apply` validé en production)

## Coût estimé

| Ressource | Coût mensuel |
|---|---|
| Instance STARDUST1-S | ~1,80 € |
| IP publique flexible IPv4 | ~3,00 € |
| Bande passante sortante | gratuit |
| **Total** | **~5 €/mois** |