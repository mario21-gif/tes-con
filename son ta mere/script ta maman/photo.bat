@echo off
setlocal

:: Variables de l'email
set SMTP_SERVER=smtp.gmail.com
set SMTP_PORT=587
set EMAIL_SENDER=ton_email@gmail.com
set EMAIL_RECEIVER=ton_email@gmail.com
set SUBJECT=Photo prise avec la webcam
set BODY=Voici la photo prise avec la webcam.
set EMAIL_PASSWORD=Ton_mot_de_passe_application  :: Utilise un mot de passe d'application Gmail

:: Ouvrir l'application Caméra
echo Ouverture de l'application Camera...
start microsoft.windows.camera:

:: Pause pour attendre que l'utilisateur prenne la photo manuellement
echo Prenez une photo avec l'application Camera, puis appuyez sur une touche pour continuer...
pause

:: Vérifie si la photo a été prise (chemin à ajuster selon le dossier de l'utilisateur)
set PHOTO_PATH=%USERPROFILE%\Pictures\Camera Roll\photo.jpg

:: Vérifie si le fichier photo existe
if not exist "%PHOTO_PATH%" (
    echo La photo n'a pas été prise ou le fichier est introuvable.
    exit /b 1
)

:: Envoi de l'email avec la photo en pièce jointe
echo Envoi de l'email...
C:\blat\blat.exe "%PHOTO_PATH%" -to %EMAIL_RECEIVER% -subject %SUBJECT% -body %BODY% -server %SMTP_SERVER% -port %SMTP_PORT% -f %EMAIL_SENDER% -u %EMAIL_SENDER% -pw %EMAIL_PASSWORD% -ssl

:: Vérifie si l'email a été envoyé avec succès
if %ERRORLEVEL% neq 0 (
    echo Une erreur s'est produite lors de l'envoi de l'email.
    exit /b 1
)

echo Photo envoyée par email avec succès.

endlocal
