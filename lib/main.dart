import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_comics_app/core/router.dart';
import 'package:marvel_comics_app/features/bottom_navigation_bar/cubit/bottom_nav_bar_cubit.dart';
import 'package:marvel_comics_app/features/comic_details/presentation/cubit/expandable_tile_cubit.dart';
import 'package:marvel_comics_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:marvel_comics_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:marvel_comics_app/features/splash_screen/presentation/bloc/splash_screen_bloc.dart';
import 'package:marvel_comics_app/services/marvel_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashScreenBloc>(
          create: (context) => SplashScreenBloc()..add(LoadSplashScreen()),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(MarvelService())..add(FetchComics()),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(MarvelService()),
        ),
        BlocProvider<BottomNavBarCubit>(
          create: (_) => BottomNavBarCubit(),
        ),
        BlocProvider<ExpandableTileCubit>(
          create: (_) => ExpandableTileCubit(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
