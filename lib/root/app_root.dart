import 'package:flutter/material.dart';
import 'package:nizwa_test/screens/first_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(canvasColor: Colors.white),
      home: const FirstScreen(),
    );
  }
}
