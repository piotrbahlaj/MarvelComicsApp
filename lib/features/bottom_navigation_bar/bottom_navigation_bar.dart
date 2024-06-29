import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_comics_app/core/theme.dart';
import 'package:marvel_comics_app/features/bottom_navigation_bar/cubit/bottom_nav_bar_cubit.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  static const List<String> _pages = [
    '/home',
    '/search',
  ];

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, currentIndex) {
        return SalomonBottomBar(
          selectedColorOpacity: 0,
          backgroundColor: MarvelColors.mainBackground,
          currentIndex: currentIndex,
          onTap: (i) {
            context.read<BottomNavBarCubit>().updateIndex(i);
            router.go(_pages[i]);
          },
          items: [
            SalomonBottomBarItem(
              icon: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 50, 0),
                child: Icon(
                  Icons.home,
                  size: MediaQuery.of(context).size.height * 0.035,
                ),
              ),
              title: const Text(''),
              selectedColor: MarvelColors.navBarItemSelected,
              unselectedColor: MarvelColors.navBarItemUnselected,
            ),
            SalomonBottomBarItem(
              icon: Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 10, 0),
                child: Icon(
                  Icons.search,
                  size: MediaQuery.of(context).size.height * 0.035,
                ),
              ),
              title: const Text(''),
              selectedColor: MarvelColors.navBarItemSelected,
              unselectedColor: MarvelColors.navBarItemUnselected,
            ),
          ],
        );
      },
    );
  }
}
