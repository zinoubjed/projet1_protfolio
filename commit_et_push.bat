@echo off
setlocal enabledelayedexpansion

:: Aller dans le dossier du projet
cd /d "C:\Users\USER\OneDrive\Desktop\projet1_protfolio\projet_1_produits_tendances"
if %ERRORLEVEL% NEQ 0 (
    echo Le chemin d’accès spécifié est introuvable.
    echo ERREUR : Le dossier du projet est introuvable
    pause
    exit /b 1
)

:: Demander un message de commit
set /p commitMsg=Entrez un message de commit : 

:: Ajouter les fichiers au suivi
git add .

:: Faire le commit avec le message
git commit -m "!commitMsg!"
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Commit échoué ou rien à commit.
    pause
    exit /b 1
)

:: Demander si on veut pousser sur GitHub
set /p pushConfirm=Souhaitez-vous pousser vers GitHub ? (O/N) : 

if /I "!pushConfirm!"=="O" (
    echo 📤 Envoi vers GitHub en cours...
    git push
    if %ERRORLEVEL% EQU 0 (
        echo ✅ Push réussi !
    ) else (
        echo ❌ Une erreur est survenue pendant le push.
    )
) else (
    echo ⏸️ Push annulé.
)

pause

