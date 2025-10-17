@echo off
REM play_silencieux_simple.bat
REM Double-clic pour jouer un son invisible

REM Chemin complet du fichier audio
SET "FILE=son ta mere\soupire\meme.mp3"

REM Vérifie que le fichier existe
IF NOT EXIST "%FILE%" (
    ECHO Le fichier audio "%FILE%" n'existe pas.
    PAUSE
    EXIT /B 1
)

REM Chemin complet vers VLC (à vérifier selon ton installation)
SET "VLC_PATH=C:\Program Files\VideoLAN\VLC\vlc.exe"

IF NOT EXIST "%VLC_PATH%" (
    ECHO VLC n'a pas été trouvé à "%VLC_PATH%".
    PAUSE
    EXIT /B 1
)

REM Lance VLC normalement pour test (pas invisible)
"%VLC_PATH%" --intf dummy --play-and-exit "%FILE%"

PAUSE
