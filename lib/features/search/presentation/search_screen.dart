import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics_app/core/text_styles.dart';
import 'package:marvel_comics_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:marvel_comics_app/features/search/presentation/widgets/search_bar.dart';
import 'package:marvel_comics_app/features/shared/widgets/comics_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: CustomSearchBar(
                hintText: 'Search for a comic book',
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 230, 0, 20),
                          child: Image.asset(
                            'assets/book_open.png',
                          ),
                        ),
                        const Text(
                          'Start typing to find a particular comic',
                          style: TextStyles.searchTitle,
                        ),
                      ],
                    );
                  } else if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchLoaded) {
                    return ListView.builder(
                      itemCount: state.comics.length,
                      itemBuilder: (context, index) {
                        final comic = state.comics[index];
                        return ComicsTile(comic: comic);
                      },
                    );
                  } else if (state is SearchError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/no_searches.png',
                            ),
                            const SizedBox(height: 30),
                            Text(
                              state.message,
                              textAlign: TextAlign.center,
                              style: TextStyles.searchErrorMessage,
                            ),
                          ],
                        ),
                      ),
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
