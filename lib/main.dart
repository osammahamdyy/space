import 'package:flutter/material.dart';
import 'package:space/screens/onBoarding.dart';
import 'package:space/screens/palnetDets.dart';
import 'package:space/screens/planetsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/onBoarding': (context) => const OnBoarding(),
        '/planets': (context) => const Planets(),
        
      },
      initialRoute: '/onBoarding',
    );

     
}
}
