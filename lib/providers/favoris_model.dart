
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/destination.dart';

/// TP7 — Partie 1 : favoris persistants.
class FavorisModel extends ChangeNotifier {
  static const _cle = 'favoris';

  // favoris rangés par id : Map<String, Destination>
  final Map<String, Destination> _favoris = {};

  bool estFavori(Destination d) => _favoris.containsKey(d.id);

  List<Destination> get favoris => List.unmodifiable(_favoris.values);

  int get nombre => _favoris.length;

  // Charger les favoris enregistrés sur l'appareil
  Future<void> charger() async {
    final prefs = await SharedPreferences.getInstance();

    final liste = prefs.getStringList(_cle) ?? [];

    debugPrint('FAVORIS CHARGÉS : ${liste.length}');
    debugPrint('CONTENU : $liste');

    for (final texte in liste) {
      final json = jsonDecode(texte);
      final destination = Destination.fromJson(json);

      _favoris[destination.id] = destination;
    }

    notifyListeners();
  }

  // Sauvegarder les favoris sur l'appareil
  Future<void> _sauvegarder() async {
    final prefs = await SharedPreferences.getInstance();

    final liste = _favoris.values
        .map((d) => jsonEncode(d.toJson()))
        .toList();

    final resultat = await prefs.setStringList(_cle, liste);

    debugPrint('FAVORIS SAUVEGARDÉS : $resultat');
    debugPrint('NOMBRE : ${liste.length}');
    debugPrint('CONTENU : $liste');
  }

  bool basculer(Destination d) {
    final ajoute = _favoris.remove(d.id) == null;

    if (ajoute) {
      _favoris[d.id] = d;
    }

    _sauvegarder();
    notifyListeners();

    return ajoute;
  }
    // Effacer tous les favoris enregistrés
  Future<void> effacer() async {
    final prefs = await SharedPreferences.getInstance();

    _favoris.clear();
    await prefs.remove(_cle);

    notifyListeners();
  }
}
