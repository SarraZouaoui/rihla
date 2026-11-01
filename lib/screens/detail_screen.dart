
import 'package:flutter/material.dart';
import '../models/destination.dart';

class DetailScreen extends StatefulWidget {
  final Destination destination;

  const DetailScreen({
    super.key,
    required this.destination,
  });

  @override
  State<DetailScreen> createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  int _voyageurs = 1;
  bool _favori = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image et boutons Retour / Favoris
          Stack(
            children: [
              Image.asset(
                widget.destination.image,
                height: 340,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),

              Positioned(
                top: 40,
                right: 16,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _favori = !_favori;
                    });
                  },
                  icon: Icon(
                    _favori ? Icons.favorite : Icons.favorite_border,
                    color: _favori ? Colors.red : Colors.black,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          // Contenu de la destination
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.nom,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey),
                      Text(widget.destination.region),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.orange),
                      Text(widget.destination.note.toStringAsFixed(1)),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Informations : durée, type et groupe
                  Row(
                    children: [
                      _infoTile(
                        Icons.access_time,
                        'Durée',
                        widget.destination.duree,
                      ),
                      _infoTile(
                        Icons.category,
                        'Type',
                        widget.destination.categorie,
                      ),
                      _infoTile(
                        Icons.group,
                        'Groupe',
                        'Petit groupe',
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'À propos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.destination.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Nombre de voyageurs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_voyageurs > 1) {
                            setState(() {
                              _voyageurs--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),

                      Text(
                        '$_voyageurs',
                        style: const TextStyle(fontSize: 18),
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            _voyageurs++;
                          });
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Barre de réservation
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Prix total'),
                    Text(
                      '${widget.destination.prix * _voyageurs} DT',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Réservation effectuée !'),
                      ),
                    );
                  },
                  child: const Text('Réserver'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget réutilisable pour les informations
  Widget _infoTile(IconData icon, String titre, String valeur) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 28, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            titre,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            valeur,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
