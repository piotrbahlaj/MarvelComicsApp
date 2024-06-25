import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComicDetailsScreen extends StatelessWidget {
  const ComicDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Details',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              router.go('/home');
            },
          )),
    );
  }
}
