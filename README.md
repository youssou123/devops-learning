# 🚀 DevOps Learning & Journey

Ce dépôt retrace mon parcours d'apprentissage pratique de la démarche DevOps. Il documente l'évolution pas à pas d'une application Node.js : de sa conteneurisation initiale jusqu'à la mise en place d'un pipeline complet d'intégration et de déploiement continus (CI/CD).

---

## 📌 Fonctionnalités & Étapes accomplies

### 1. ⚙️ Intégration Continue (CI)
- **GitHub Actions** : Validation automatique du code à chaque Pull Request.
- **Vérifications de qualité** : Exécution des tests automatisés et analyse de code.

### 2. 🐳 Conteneurisation avec Docker
- **Dockerfile optimisé** : Utilisation d'une image de base légère (`Node.js Alpine`) et isolation des fichiers via `.dockerignore`.
- **Exposition de service** : Redirection des ports réseau (`8080:3000`).
- **Validation CI** : Construction automatique de l'image Docker dans le pipeline GitHub Actions à chaque PR.

### 3. 📦 Registre de Conteneurs (GHCR)
- **GitHub Container Registry** : Authentification sécurisée via `GITHUB_TOKEN` et publication d'images Docker distantes.
- **Taggage dynamique** : Marquage automatique avec les tags `latest` et le commit SHA (`type=sha`).

### 4. 🎼 Orchestration Multi-Conteneurs (Docker Compose)
- **Architecture Multi-Services** : Intégration d'une base de données de cache **Redis** connectée à l'application Node.js.
- **Réseau virtuel Docker** : Communication inter-conteneurs via `REDIS_URL`.
- **Incrémentation de compteur** : Comptage dynamique des visites enregistré dans Redis.

### 5. 🚀 Déploiement Continu (CD)
- **Hébergement Cloud** : Déploiement automatisé vers **Render**.
- **Webhooks & Secrets** : Déclenchement automatique des déploiements via `RENDER_DEPLOY_HOOK` lors des fusions (*merges*) sur la branche `main`.

---

## 🛠️ Stack Technique

- **Langage & Framework** : Node.js (JavaScript), Redis
- **Conteneurisation & Orchestration** : Docker, Docker Compose
- **CI/CD & Registre** : GitHub Actions, GitHub Container Registry (GHCR)
- **Hébergement Cloud** : Render

---

## 💻 Instructions pour exécuter en local

### Prérequis
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Git](https://git-scm.com/)

### Lancer la stack complète
```bash
# 1. Cloner le projet
git clone [https://github.com/youssou123/devops-learning.git](https://github.com/youssou123/devops-learning.git)
cd devops-learning

# 2. Lancer l'application et Redis avec Docker Compose
docker compose up --build -d