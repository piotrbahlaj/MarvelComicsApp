import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_comics_app/features/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:marvel_comics_app/features/comic_details/presentation/comic_details_screen.dart';
import 'package:marvel_comics_app/features/home/presentation/home_screen.dart';
import 'package:marvel_comics_app/features/search/presentation/search_screen.dart';
import 'package:marvel_comics_app/features/splash_screen/presentation/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    // shell route so the nav bar stays on through all the screens besides the splash screen
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const CustomNavigationBar(),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/comicDetails',
          builder: (context, state) => ComicDetailsScreen(
            comic: state.extra as Map<String, dynamic>,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
