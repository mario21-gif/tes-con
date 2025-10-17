@echo off
chcp 65001

:: Définir le chemin de l'icône du curseur (assurez-vous que l'icône existe à cet emplacement)
set "icone_chemin=%~dp0son ta mere\images\lol2.ico"

:: Vérifier si le fichier .ico existe
if not exist "%icone_chemin%" (
    echo Le fichier icone lol2.ico n'a pas été trouvé !
    pause
    exit /b
)

:: Modifier le registre pour utiliser le nouveau curseur
echo Modification des paramètres du curseur...
reg add "HKCU\Control Panel\Cursors" /v Arrow /t REG_SZ /d "%icone_chemin%" /f

:: Appliquer les changements (cela peut demander un redémarrage ou de redémarrer l'Explorer)
echo Le curseur a été changé. Vous devrez peut-être redémarrer Explorer ou vous reconnecter pour appliquer les changements.
pause
