# Migration — kiwinet.me vers VPS Scaleway

Procédure de bascule du site kiwinet.me depuis la VM Freebox vers le VPS Scaleway.
À exécuter après `terraform apply` et `ansible-playbook playbook-cloud.yml` validés.

## Prérequis

- `terraform apply` terminé — IP flexible disponible : `terraform output instance_public_ip`
- `ansible-playbook playbook-cloud.yml` terminé sans erreur
- Container actif vérifié : `curl -s -o /dev/null -w "%{http_code}" http://<ip>` → `200`

---

## 1. GitHub Secrets — kiwinet-web

`github.com/Rookain-Kiwi/kiwinet-web` → Settings → Secrets → Actions :

| Secret | Valeur |
|---|---|
| `DEPLOY_HOST` | IP flexible Scaleway |
| `DEPLOY_USER` | `rookain` |
| `DEPLOY_PORT` | `2222` |

`DEPLOY_SSH_KEY` et `GHCR_TOKEN` sont inchangés.

---

## 2. Bascule DNS (Bluehost)

Modifier l'enregistrement A de `kiwinet.me` :
- **Points to** : IP flexible Scaleway
- Répéter pour `www` si enregistrement A séparé

Propagation : 5 min à 24h.

---

## 3. Vérification post-bascule

```bash
dig kiwinet.me +short
curl -s -o /dev/null -w "%{http_code}" http://kiwinet.me
```

---

## Rollback

Remettre l'enregistrement A DNS vers l'IP Freebox (`82.67.126.108`).
Le `docker-compose.vm.yml` dans `kiwinet-web` permet de relancer le service sur la Freebox.

---

## Notes

- HTTPS non géré sur le VPS cloud (hors périmètre Phase 3) — site accessible en HTTP uniquement.
- Pour ajouter HTTPS : déployer Traefik + Let's Encrypt sur le VPS.