@echo off
chcp 65001 >nul
title Changeur d'Icône
color 0A

cls
echo ╔════════════════════════════════════════╗
echo ║   🎨 CHANGEMENT DES ICÔNES...  🎨     ║
echo ╚════════════════════════════════════════╝
echo.

:: Chemin de ton icône
set "icon=%~dp0..\images\lol.ico"

:: Vérifier si l'icône existe
if not exist "%icon%" (
    echo ❌ Erreur : Le fichier icône n'existe pas !
    echo Cherché à : %icon%
    timeout /t 5 >nul
    exit
)

echo ✅ Icône trouvée : lol.ico
echo.

:: Créer un script VBS temporaire pour modifier les raccourcis
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%temp%\changeicon.vbs"
echo sLinkFile = WScript.Arguments(0) >> "%temp%\changeicon.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%temp%\changeicon.vbs"
echo oLink.IconLocation = WScript.Arguments(1) ^& ",0" >> "%temp%\changeicon.vbs"
echo oLink.Save >> "%temp%\changeicon.vbs"

echo 🔄 Changement de toutes les icônes du Bureau...
echo.

:: Chemin du Bureau
set "desktop=%USERPROFILE%\Desktop"

:: Compter et changer tous les raccourcis
set count=0
for %%F in ("%desktop%\*.lnk") do (
    echo    ➤ %%~nxF
    cscript //nologo "%temp%\changeicon.vbs" "%%F" "%icon%"
    set /a count+=1
)

echo.
echo ✅ %count% raccourci(s) modifié(s) !
echo.

:: Nettoyer le script temporaire
if exist "%temp%\changeicon.vbs" del "%temp%\changeicon.vbs"

echo Appuyez sur une touche pour fermer...
pause >nul
exit