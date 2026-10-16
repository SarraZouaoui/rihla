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