## Plan d’industrialisation du projet

### Phase 1 : Développement local
- Écrire et tester les scripts de scraping en local (ex: notebook Python)
- Stocker les données collectées localement (CSV, JSON)
- Versionner le code et les données avec Git (code) + DVC (données)
- Construire un dashboard local avec Streamlit pour visualiser les résultats

### Phase 2 : Industrialisation
- Dockeriser le projet pour un environnement stable et reproductible
- Mettre en place une base de données pour gérer les volumes importants de données
- Héberger le projet dans le cloud pour automatiser et rendre accessible (AWS, GCP, Heroku…)
- Automatiser le scraping via un scheduler (cron, cloud functions)

---


