import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  static const Color red = Color(0xFFEE403D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: [
          // Planet fills the screen, anchored left so it's cropped like the design
          Positioned.fill(
            bottom: 100,
            child: Image.asset(
              'lib/assets/onBoarding.png',
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
            ),
          ),

          // Title
          const Positioned(
            left: 24,
            top: 0,
            bottom: 0,
            child: Center(
              child: Text(
                'Explore\nThe\nUniverse',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),
            ),
          ),

         
          Positioned(
            left: 24,
            right: 24,
            bottom: 32,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/planets');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  foregroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.arrow_forward, size: 20),
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