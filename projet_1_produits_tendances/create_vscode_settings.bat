@echo off
REM Crée le dossier .vscode s'il n'existe pas
if not exist ".vscode" mkdir .vscode

REM Crée ou écrase le fichier settings.json avec le contenu requis
echo {
  "python.pythonPath": "C:\\Users\\USER\\anaconda3\\envs\\produits_env\\python.exe"
} > .vscode\settings.json

echo Fichier .vscode\settings.json créé avec succès !
pause
