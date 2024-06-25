import 'package:flutter/material.dart';
import 'package:marvel_comics_app/features/splash_screen/presentation/splash_screen.dart';

void main() {
  runApp(
    const Main(),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
