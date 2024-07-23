import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics_app/core/text_styles.dart';
import 'package:marvel_comics_app/core/theme.dart';
import 'package:marvel_comics_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:marvel_comics_app/features/shared/widgets/comics_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Text(
                  'Marvel Comics',
                  style: TextStyles.mainTitle,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: MarvelColors.circularIndicator,
                      ),
                    );
                  } else if (state is HomeLoaded) {
                    // I ignored the first 3 positions since they had no image and description which looked poorly as a front page
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
