Plaier_2
1) sans Expanded la column prend seulement sa largeur  nécessaire donc l'avatar se place juste aprés 

2) prenom est déclaré final car sa valeur ne doit pas etre modifiée ensuite 

3)  cs.primary dépend de seedColor, tandis que Colors.teal reste fixe même si seedColor change.


Palier_3
1) voir image (Q1_Palier_1.png) dans assets 
Si je place le DecoratedBox au début de children, avant l'image  lorsque l'image apparaît elle cache l'effet et la décoration du DecoratedBox car dans un Stack  le premier enfant est à l'arrière-plan et le dernier est au premier plan
voir code en cmtr dans hero_banner.dart 

2) Sans ClipRRect, l'image et le dégradé dépassent des coins arrondis

3) right: 130 réserve un espace à droite pour éviter que le texte soit collé au bouton


Palier_4

1) Expanded reserve à  la Column la largeur nécessaire ce qui permet au Spacer de répartir l'espace restant dans la Row note/prix et de pousser le prix vers la droite


2) En ajoutant une destination dans la liste destinations du fichier destinations.dart homeScreen va le creer automatiquement 


Palier_5

1) Sans setState() , le changement de la variable _categorie ne s'affiche pas automatiquement dans l'ecran 


2) _filtrees est un getter recalculé à chaque build()
 pour obtenir les destinations correspondant à la catégorie choisie

 3)  HeroBanner peut rester un StatelessWidget car il affiche une destination reçue en paramètre et ne gère pas son propre état


 suite du TP: navigation et formulaire 

 Palirer_2:

 1) 
  Oui, le filtre est conservé.Navigator.push ajoute DetailScreen au-dessus de HomeScreen dans la pile. Quand on utilise Navigator.pop, DetailScreen est retiré de la pile .


2)  DetailScreen reçoit la destination grâce au constructeur

3) Sans clipBehavior, les effets visuels de la carte ne respectent plus  ses coins arrondis lorsqu'on la touche


Palier3

1) Cette méthode sert à valider tous les champs du formulaire (en exécutant chaque fonction validator)


2) inputFormatters filtre pendant la saisie elle empèche l'utilisateur d'entrer autre chose que des chiffres , tandis que validator vérifie après la saisie lorsque l'utilisateur veut valider le formulaire  .


3) dispose() permet la libération de la mémoire et d'éviter de conserver inutilement des ressources lorsqu'on détruit l'ecran ou on ferme le form 


Palier4:

1) Le champ date est en readOnly pour empêcher l'utilisateur de saisir manuellement une date


2) _total est un getter qui calcule automatiquement le prix total à partir de _prixParPersonne et du nombre de voyageurs.


Palier5:

1)  reservation retourne null, car l'utilisateur quitte le formulaire sans confirmer sa réservation


2) VS Code affiche un avertissement lié à use_build_context_synchronously
Le test if (!mounted) return; permet de vérifier que le widget existe toujours avant d'utiliser son context


3) Navigator.pop(context) permet  de fermer la boîte de dialogue et de revenir à l'écran précédent, sans quitter DetailScreen