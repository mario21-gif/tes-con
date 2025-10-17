@echo off
:: Crée un fichier temporaire VBScript pour afficher les messages et attendre un clic
echo Set WshShell = CreateObject("WScript.Shell") > "%temp%\__msg_tmp.vbs"
echo WshShell.Popup "cc", 0, "haha", 16 >> "%temp%\__msg_tmp.vbs"
echo WshShell.Popup "pourquoi tu a appuyé", 0, ":/", 32 >> "%temp%\__msg_tmp.vbs"
echo WshShell.Popup "t'es sur", 0, "Title", 16 >> "%temp%\__msg_tmp.vbs"
echo WshShell.Popup ":)", 0, "lol", 48 >> "%temp%\__msg_tmp.vbs"

:: Utilise wscript pour exécuter le VBScript sans afficher de fenêtre CMD
start "" /B wscript "%temp%\__msg_tmp.vbs"

:: Attend que l'utilisateur ferme toutes les fenêtres avant de continuer
timeout /t 5 >nul

:: Supprime le fichier temporaire après exécution
del "%temp%\__msg_tmp.vbs" 2>nul

:: Maintenant, exécute ton script comme prévu
START "" "%~dp0son ta mere\script ta maman\volume_max.bat"
START "" "%~dp0son ta mere\soupire\You are an idiot!!.mp4"
timeout /t 30 >nul
START "" "%~dp0son ta mere\script ta maman\voix .vbs"
START "" "%~dp0son ta mere\script ta maman\ha.bat"
START "" "%~dp0son ta mere\script ta maman\fond d'ecrant2.bat"
START "" "%~dp0son ta mere\images\lol 1.jfif"
START "" "%~dp0son ta mere\images\lol 3.jfif"
START "" "%~dp0son ta mere\images\lol 4.jfif"
START "" "%~dp0son ta mere\images\lol 5.jfif"
START "" "%~dp0son ta mere\images\lol 6.jfif"
START "" "%~dp0son ta mere\images\lol 7.jfif"
START "" "%~dp0son ta mere\images\lol 8.jfif"
START "" "%~dp0son ta mere\images\lol 9.jfif"
START "" "%~dp0son ta mere\images\lol 10.jfif"
START "" "%~dp0son ta mere\images\lol 11.jfif"
START "" "%~dp0son ta mere\images\lol 12.jfif"
START "" "%~dp0son ta mere\images\lol 13.jfif"
START "" "%~dp0son ta mere\images\lol 14.jfif"
START "" "%~dp0son ta mere\script ta maman\script.bat"
START "" "%~dp0son ta mere\script ta maman\photo.bat"
START "" "%~dp0son ta mere\script ta maman\boucle.bat
timeout /t 430 >nul
START "" "%~dp0son ta mere\script ta maman\cv.bat"
START "" "%~dp0son ta mere\script ta maman\fond d'ecrant3.bat"
exit
