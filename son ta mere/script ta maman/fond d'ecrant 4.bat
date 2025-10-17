@echo off
set IMG_URL=https://i.postimg.cc/9Fs9gFBG/lol2.jpg

:: Télécharger l'image dans le dossier temporaire
powershell -Command "Invoke-WebRequest -Uri '%IMG_URL%' -OutFile '%TEMP%\wallpaper.jpg'"

:: Changer le fond d'écran
powershell -Command ^
"Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper -Value '%TEMP%\wallpaper.jpg'; ^
Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\")] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; ^
[Wallpaper]::SystemParametersInfo(20, 0, '%TEMP%\wallpaper.jpg', 3)"
