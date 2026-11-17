
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favoris_model.dart';
import '../widgets/destination_card.dart';

class FavorisScreen extends StatelessWidget {
  const FavorisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoris = context.watch<FavorisModel>().favoris;

    return favoris.isEmpty
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite_border, size: 48),
                SizedBox(height: 12),
                Text('Aucun favori pour le moment'),
              ],
            ),
          )
        : ListView(
            padding: const EdgeInsets.all(20),
            children: [
              for (final destination in favoris)
                DestinationCard(
                  key: ValueKey(destination.id),
                  destination: destination,
                ),
            ],
          );
  }
}
