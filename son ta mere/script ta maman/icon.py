import tkinter as tk
import random

root = tk.Tk()

root.attributes("-fullscreen", True)
root.overrideredirect(True)
root.wm_attributes("-topmost", True)
root.wm_attributes("-transparentcolor", "white")

root.config(bg='white')

# Charger l'image avec le chemin corrigé
try:
    photo = tk.PhotoImage(file=r"son ta mere\images\hi.png")
except tk.TclError:
    print("Erreur de chargement de l'image. Vérifiez le chemin.")
    root.quit()  # Quitter si l'image ne se charge pas

# Fonction pour mettre à jour la position de l'étiquette
def move_label():
    # Créer une nouvelle étiquette avec l'image à une position aléatoire
    a = tk.Label(root, image=photo, fg='red', bg='white')
    a.place(x=random.randint(0, 2000), y=random.randint(0, 2000))
    
    # Re-appeler la fonction move_label toutes les 100 millisecondes
    root.after(100, move_label)

# Démarrer le mouvement de l'étiquette
move_label()

root.mainloop()
