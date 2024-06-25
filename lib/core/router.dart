import 'package:go_router/go_router.dart';
import 'package:marvel_comics_app/features/home/presentation/home_screen.dart';
import 'package:marvel_comics_app/features/search/presentation/search_screen.dart';
import 'package:marvel_comics_app/features/splash_screen/presentation/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    )
  ],
);
