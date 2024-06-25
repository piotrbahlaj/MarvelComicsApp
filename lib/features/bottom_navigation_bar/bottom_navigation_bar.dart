import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

final List<String> _pages = [
  '/',
  '/search',
];

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      backgroundColor: Theme.of(context).colorScheme.background,
      currentIndex: _currentIndex,
      onTap: (i) {
        setState(() => _currentIndex = i);
        final router = GoRouter.of(context);
        router.go(_pages[i]);
      },
      items: [
        // Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          selectedColor: Colors.red,
          unselectedColor: Colors.black,
        ),
        SalomonBottomBarItem(
          icon: const SizedBox(),
          title: const Text(''),
        ),
        // Search
        SalomonBottomBarItem(
          icon: const Icon(Icons.search),
          title: const Text('Search'),
          selectedColor: Colors.red,
          unselectedColor: Colors.black,
        ),
      ],
    );
  }
}
