import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics_app/features/home/presentation/bloc/home_bloc.dart';
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
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeLoaded) {
                    final List<Map<String, dynamic>> comicsToDisplay =
                        state.comics.skip(3).toList();
                    return ListView.builder(
                      itemCount: comicsToDisplay.length,
                      itemBuilder: (context, index) {
                        final comic = comicsToDisplay[index];
                        return ComicsTile(comic: comic);
                      },
                    );
                  } else if (state is HomeError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
