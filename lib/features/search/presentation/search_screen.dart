import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics_app/features/home/presentation/widgets/comics_tile.dart';
import 'package:marvel_comics_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:marvel_comics_app/features/search/presentation/widgets/search_bar.dart';

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
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  } else if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchLoaded) {
                    if (state.comics.isEmpty) {
                      return const Center(
                        child: Text(
                          'There is no comic book with that name in our library. Check the spelling and try again',
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: state.comics.length,
                        itemBuilder: (context, index) {
                          final comic = state.comics[index];
                          return ComicsTile(comic: comic);
                        },
                      );
                    }
                  } else if (state is SearchError) {
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
