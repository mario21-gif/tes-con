@echo off
:: Récupérer le chemin du bureau de l'utilisateur
set "Desktop=%USERPROFILE%\Desktop"

:: Compteur pour les copies
set /a count=1

:: Faire 7 copies
:copy_loop
if %count% leq 7 (
    :: Copier le script .bat avec un nom différent à chaque fois
    copy "%~f0" "%Desktop%\MonScript_%count%.bat"
    
    :: Incrémenter le compteur
    set /a count+=1
    
    :: Revenir à la boucle de copie
    goto :copy_loop
)

:: Message de confirmation
echo Le script a été copié 7 fois sur votre bureau !
pause
