@echo off
setlocal enabledelayedexpansion

:: Aller dans le dossier du projet
cd /d "C:\Users\USER\OneDrive\Desktop\projet1_protfolio\projet_1_produits_tendances" || (
    echo ❌ ERREUR : Le dossier du projet est introuvable !
    pause
    exit /b 1
)

:: Activer l'environnement conda
call "C:\Users\USER\anaconda3\Scripts\activate.bat"
call conda activate produits_env || (
    echo ❌ ERREUR : Impossible d'activer l'environnement conda "produits_env"
    pause
    exit /b 1
)

:: Ouvrir VS Code dans le dossier du projet
start "" code .

:: Lancer JupyterLab dans le dossier du projet
start "" jupyter lab --notebook-dir="%CD%" || (
    echo ❌ ERREUR : Impossible de lancer Jupyter Lab
    pause
    exit /b 1
)

:: Attendre quelques secondes pour s'assurer que Jupyter démarre
timeout /t 5 /nobreak > nul

:: Ouvrir Chrome dans une nouvelle fenêtre indépendante sur JupyterLab
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window "http://localhost:8888/lab" || (
    echo ❌ ERREUR : Impossible d'ouvrir Chrome
    pause
    exit /b 1
)

:: Fin du script
echo ✅ Projet lancé avec succès.
exit
