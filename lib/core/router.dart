import 'package:go_router/go_router.dart';
import 'package:marvel_comics_app/features/home/presentation/home_screen.dart';
import 'package:marvel_comics_app/features/search/presentation/search_screen.dart';

final router = GoRouter(
  initialLocation: '/', //home screen
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    )
  ],
);
