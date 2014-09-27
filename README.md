rogue
=====

The Rogue Scheme compiler by Emmanuel Bengio and Alexandre St-Louis Fortier.

Structure
=========

L'environnement autour du compilateur doit offrir les fonctionnalités suivantes:
*  Gérer des options de ligne de commandes.
*  Écrire des fichiers source et/ou exécutable (possiblement par un module qui peux 
   être réutiliser selon les backends)
*  Offrir un module qui gère l'affichage des messages d'erreur, etc.

Les différentes étapes de compilation (brouillon!):
*  parsing (fonction read)
*  création de l'AST (l'AST sera probalbement le résultat de la fonction read)
*  traduction en représentation interne linéaire (assembleur en s-exp)
*  traduction en x86–64 (choix binaire ou assembleur)



