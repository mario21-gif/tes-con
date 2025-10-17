@echo off
:: Script pour mettre le volume système à 100 % sans utiliser de chemin absolu (C:)

:: %~dp0 = dossier où se trouve le script .bat
set "NIRCMD=%~dp0tes un con"

:: Vérifie que nircmd.exe est bien dans le même dossier
if not exist "%NIRCMD%" (
    echo Erreur : nircmd.exe est introuvable dans le dossier :
    echo %~dp0
    echo Place nircmd.exe dans le même dossier que ce script.
    pause
    exit /b 1
)

:: Met le volume à 100 %
"%NIRCMD%" setsysvolume 65535

pause
