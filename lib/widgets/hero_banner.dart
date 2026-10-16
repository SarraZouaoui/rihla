import 'package:flutter/material.dart';
import '../models/destination.dart';
 
class HeroBanner extends StatelessWidget {
  final Destination destination;
 
  const HeroBanner({super.key, required this.destination});
 
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
              /*const DecoratedBox(
             decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
           ),*/
            // Couche 1 : l'image
            Image.asset(destination.image, fit: BoxFit.cover),
 
            // Couche 2 : dégradé pour la lisibilité du texte blanc
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
 
            // TODO 1 : Positioned(top: 16, right: 16) contenant un badge blanc
            //          arrondi : étoile ambre + note de la destination
            Positioned(
          top: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  destination.note.toStringAsFixed(1),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
            ),

            // TODO 2 : Positioned(left: 20, right: 130, bottom: 20) contenant
            //         une Column : 'DESTINATION DU MOIS', le nom, la région
          
          Positioned(
          left: 20,
          right: 130,
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'DESTINATION DU MOIS',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                destination.nom,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                destination.region,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),

         Positioned(
          right: 16,
          bottom: 20,
          child: FilledButton(
            onPressed: () {},
            child: const Text('Découvrir'),
          ),
        ),





          ],
        ),
      ),
    );
  }
}