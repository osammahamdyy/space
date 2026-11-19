import 'package:flutter/material.dart';
import 'package:space/assets/planetsData/data.dart';

class PlanetDetails extends StatelessWidget {
  final Planet planet;
  const PlanetDetails({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top planet + back button + name
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: 0.6 * w,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'lib/assets/topscreen.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      const Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Color(0xFF0D0D0D)],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    children: [
                      IconButton.filled(
                        onPressed: () => Navigator.pop(context),
                        style: IconButton.styleFrom(
                          backgroundColor: const Color(0xFFEE403D),
                        ),
                        icon: const Icon(Icons.arrow_back, size: 20),
                      ),
                      Expanded(
                        child: Text(
                          planet.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // balances the back button
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planet.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(child: Image.asset(planet.image, width: w * 0.7)),
                  const SizedBox(height: 24),
                  const Text(
                    'About',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    planet.about,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _stat('Distance from Sun (km)', planet.distance),
                  _stat('Length of Day (hours)', planet.day),
                  _stat('Orbital Period (Earth years)', planet.orbit),
                  _stat('Radius (km)', planet.radius),
                  _stat('Mass (kg)', planet.mass),
                  _stat('Gravity (m/s²)', planet.gravity),
                  _stat('Surface Area (km²)', planet.area),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        '$label : $value',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
