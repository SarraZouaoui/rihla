import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/destination.dart';
import '../providers/favoris_model.dart';

class FavoriteButton extends StatelessWidget {
  final Destination destination;

  const FavoriteButton({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final favoris = context.watch<FavorisModel>();
    final estFavori = favoris.estFavori(destination);

    return IconButton(
      onPressed: () {
        final estAjoute =
            context.read<FavorisModel>().basculer(destination);

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                estAjoute
                    ? 'Ajouté aux favoris'
                    : 'Retiré des favoris',
              ),
              duration: const Duration(seconds: 1),
            ),
          );
      },
      icon: Icon(
        estFavori ? Icons.favorite : Icons.favorite_border,
        color: estFavori ? Colors.red : null,
      ),
    );
  }
}