@echo off
rem icons_wave.bat
rem Affiche plusieurs petites fenêtres sans bord contenant uniquement l'icône d'erreur,
rem fond transparent, et les fait se déplacer lentement.
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; ^
   $count = 18;                # nombre d'icônes à créer ^
   $spawnDelay = 200;          # ms entre chaque apparition ^
   $moveInterval = 50;         # ms intervalle du timer de mouvement ^
   $speed = 2;                 # vitesse de déplacement (pixels par tick) ^
   $rnd = New-Object System.Random; ^
   $forms = @(); ^
   $screen = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea; ^
   for ($i=0; $i -lt $count; $i++) { ^
     $f = New-Object System.Windows.Forms.Form; ^
     $f.FormBorderStyle = 'None'; ^
     $f.ShowInTaskbar = $false; ^
     $f.StartPosition = 'Manual'; ^
     $f.TopMost = $true; ^
     # utilisation d'une couleur de transparence (magenta) pour laisser uniquement l'icône visible
     $f.BackColor = [System.Drawing.Color]::Magenta; ^
     $f.TransparencyKey = [System.Drawing.Color]::Magenta; ^
     $size = 48; ^
     $f.Size = New-Object System.Drawing.Size($size,$size); ^
     # position initiale aléatoire (garantie à l'écran)
     $x = $rnd.Next(0, [int]($screen.Width - $size)); ^
     $y = $rnd.Next(0, [int]($screen.Height - $size)); ^
     $f.Location = New-Object System.Drawing.Point($x,$y); ^
     # picturebox contiendra l'icône d'erreur
     $pb = New-Object System.Windows.Forms.PictureBox; ^
     $pb.Dock = 'Fill'; $pb.SizeMode = 'CenterImage'; ^
     $pb.Image = [System.Drawing.SystemIcons]::Error.ToBitmap(); ^
     $f.Controls.Add($pb); ^
     # stocke une direction de déplacement aléatoire (dx,dy)
     $dx = ($rnd.NextDouble() * 2 - 1) * $speed; ^
     $dy = ($rnd.NextDouble() * 2 - 1) * $speed; ^
     $meta = New-Object psobject -Property @{ form = $f; dx = $dx; dy = $dy }; ^
     $forms += $meta; ^
     # fermer au clic droit sur l'icône
     $pb.Add_MouseUp({ param($s,$e) if ($e.Button -eq 'Right') { $thisform = $s.FindForm(); $thisform.Close() } }); ^
     # montrer progressivement (fade-in) - option simple : Show()
     $f.Show(); ^
     Start-Sleep -Milliseconds $spawnDelay; ^
   } ^
   # Timer global pour déplacer toutes les formes
   $tm = New-Object System.Windows.Forms.Timer; ^
   $tm.Interval = $moveInterval; ^
   $tm.Add_Tick({ ^
     foreach ($m in $forms.ToArray()) { ^
       $f = $m.form; ^
       if ($f.IsDisposed) { $forms = $forms | Where-Object { $_.form -ne $null -and $_.form.Handle -ne 0 -and $_.form -ne $f } ; continue } ^
       $newx = [int]($f.Location.X + $m.dx); ^
       $newy = [int]($f.Location.Y + $m.dy); ^
       if ($newx -lt 0 -or $newx -gt ($screen.Width - $f.Width)) { $m.dx = -$m.dx; $newx = [int]($f.Location.X + $m.dx) } ^
       if ($newy -lt 0 -or $newy -gt ($screen.Height - $f.Height)) { $m.dy = -$m.dy; $newy = [int]($f.Location.Y + $m.dy) } ^
       $f.Location = New-Object System.Drawing.Point($newx, $newy); ^
     } ^
     # si plus aucune fenêtre active, arrêter le timer
     if ($forms.Count -eq 0) { $tm.Stop(); [System.Windows.Forms.Application]::ExitThread() } ^
   }); ^
   $tm.Start(); ^
   # boucle de messages pour garder les forms vivantes
   [System.Windows.Forms.Application]::DoEvents(); ^
   # Démarre une boucle qui maintient l'application jusqu'à fermeture manuelle des icônes
   while ($forms.Count -gt 0) { Start-Sleep -Milliseconds 200; [System.Windows.Forms.Application]::DoEvents() } ^
  "
exit /b
