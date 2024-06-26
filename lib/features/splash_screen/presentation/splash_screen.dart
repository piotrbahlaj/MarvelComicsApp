import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_comics_app/core/theme.dart';
import 'package:marvel_comics_app/features/splash_screen/presentation/bloc/splash_screen_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashScreenLoaded) {
            context.go('/home');
          }
        },
        child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
          builder: (context, state) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                fit: StackFit.expand,
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    'assets/splash_screen.png',
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    bottom: 130,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          color: MarvelColors.circularIndicator,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
