import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/search_box.dart';
import '../widgets/hero_banner.dart';
import '../data/destinations.dart';

 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const HomeHeader(prenom: 'Sarra') ,
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const SearchBox(),
            HeroBanner(destination: destinations.first)
          ],
        ),
      ),
    );
  }
}