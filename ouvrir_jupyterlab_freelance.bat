@echo off
setlocal enabledelayedexpansion

:: ✅ Aller dans le dossier du projet (adapter si besoin)
cd /d "C:\Users\USER\OneDrive\Desktop\projet1_protfolio\projet_1_produits_tendances" || (
    echo ❌ ERREUR : Le dossier du projet est introuvable !
    pause
    exit /b 1
)

:: ✅ Initialiser Conda (active le script d’activation)
call "C:\Users\USER\anaconda3\Scripts\activate.bat" || (
    echo ❌ ERREUR : Impossible d'appeler activate.bat de Conda
    pause
    exit /b 1
)

:: ✅ Activer l’environnement conda "produits_env"
call conda activate produits_env || (
    echo ❌ ERREUR : Impossible d’activer l’environnement conda "produits_env"
    pause
    exit /b 1
)

:: ✅ Lancer VS Code dans le dossier courant
start "" "C:\Users\USER\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%CD%"

:: ✅ Lancer Jupyter Lab dans ce dossier SANS ouvrir de fenêtre parasite
start "" /min cmd /c "jupyter lab --notebook-dir=%CD% >nul 2>&1"

:: ✅ Attendre que le serveur Jupyter démarre (5 secondes)
timeout /t 5 /nobreak > nul

:: ✅ Ouvrir UNE SEULE fenêtre Chrome sur JupyterLab
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window "http://localhost:8888/lab"

:: ✅ Afficher un message final
echo ✅ Environnement prêt, Jupyter Lab et VS Code ouverts dans le bon dossier.
exit /b 0
