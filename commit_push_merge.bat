@echo off
REM Script interactif git commit, push, merge et switch branche

cd /d "C:\Users\USER\OneDrive\Desktop\projet1_protfolio\projet_1_produits_tendances"
call conda activate ton_env

REM Demande si nouvelle branche ou existante
set /p branchType=Voulez-vous créer une nouvelle branche (N) ou travailler sur une branche existante (E) ? [N/E] : 

if /I "%branchType%"=="N" (
    set /p newBranchName=Entrez le nom de la nouvelle branche : 
    git checkout -b %newBranchName%
    set "currentBranch=%newBranchName%"
) else (
    git branch
    set /p existingBranchName=Entrez le nom de la branche existante : 
    git checkout %existingBranchName%
    set "currentBranch=%existingBranchName%"
)

REM Ajouter tous les fichiers modifiés
git add .

REM Demander message de commit
set /p msg=Entrez un message de commit : 

REM Commit
git commit -m "%msg%"

REM Pousser la branche active sur origin
git push origin %currentBranch%

REM Demander si on veut fusionner dans main
set /p mergeMain=Voulez-vous fusionner cette branche dans main maintenant ? (O/N) : 

if /I "%mergeMain%"=="O" (
    git checkout main
    git pull origin main
    git merge %currentBranch%
    git push origin main
) else (
    echo Fusion annulée.
)

echo Script terminé. Appuyez sur une touche pour fermer.
pause >nul
