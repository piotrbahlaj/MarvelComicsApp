import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_comics_app/core/theme.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

final List<String> _pages = [
  '/home',
  '/search',
];

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      selectedColorOpacity: 0,
      backgroundColor: MarvelColors.mainBackground,
      currentIndex: _currentIndex,
      onTap: (i) {
        setState(() => _currentIndex = i);
        final router = GoRouter.of(context);
        router.go(_pages[i]);
      },
      items: [
        SalomonBottomBarItem(
          icon: const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
            child: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          title: const Text(''),
          selectedColor: MarvelColors.navBarItemSelected,
          unselectedColor: MarvelColors.navBarItemUnselected,
        ),
        SalomonBottomBarItem(
          icon: const Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 10, 0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          title: const Text(''),
          selectedColor: MarvelColors.navBarItemSelected,
          unselectedColor: MarvelColors.navBarItemUnselected,
        ),
      ],
    );
  }
}
