import 'package:flutter/material.dart';
import 'package:space/assets/planetsData/data.dart';
import 'package:space/screens/palnetDets.dart';

class Planets extends StatefulWidget {
  const Planets({super.key});

  @override
  State<Planets> createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
  final names = [
    'Earth',
    'Mercury',
    'Venus',
    'Mars',
    'Jupiter',
    'Saturn',
    'Uranus',
    'Neptune',
    'Sun',
  ];
  final images = [
    'lib/assets/earth.png',
    'lib/assets/mercury.png',
    'lib/assets/venus.png',
    'lib/assets/mars.png',
    'lib/assets/jupiter.png',
    'lib/assets/saturn.png',
    'lib/assets/uranus.png',
    'lib/assets/neptune.png',
    'lib/assets/sun.png',
  ];
  int i = 0;

  void next() => setState(() => i = (i + 1) % names.length);
  void back() => setState(() => i = (i - 1 + names.length) % names.length);

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFEF3E3A);

    return Scaffold(
      backgroundColor: Color(0xFF0D0D0D),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top half planet + "Explore" title
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ClipRect(
                  child: Image.asset(
                    'lib/assets/topscreen.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned.fill(
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
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'Explore',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Text(
              'Which planet\nwould you like to explore?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Image.asset(images[i], width: 350, height: 350),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.filled(
                  onPressed: back,
                  style: IconButton.styleFrom(backgroundColor: red),
                  icon: const Icon(Icons.arrow_back, size: 18),
                ),
                Text(
                  names[i],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton.filled(
                  onPressed: next,
                  style: IconButton.styleFrom(backgroundColor: red),
                  icon: const Icon(Icons.arrow_forward, size: 18),
                ),
              ],
            ),
          ),

          // Button
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlanetDetails(planet: planets[i]),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  foregroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Explore ${names[i]}'),
                    const Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
