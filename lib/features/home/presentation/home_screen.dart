import 'package:flutter/material.dart';
import 'package:marvel_comics_app/features/home/presentation/widgets/comics_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: const Text(
                'Marvel Comics',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  children: const [
                    ComicsTile(),
                    ComicsTile(),
                    ComicsTile(),
                    ComicsTile(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
