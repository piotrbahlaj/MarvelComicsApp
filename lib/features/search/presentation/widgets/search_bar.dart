import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics_app/core/text_styles.dart';
import 'package:marvel_comics_app/core/theme.dart';
import 'package:marvel_comics_app/features/search/presentation/bloc/search_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: MarvelColors.searchBar,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              TextField(
                onChanged: (query) {
                  context.read<SearchBloc>().add(SearchQueryChanged(query));
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: MarvelColors.searchImage,
                  ),
                  hintText: hintText,
                  hintStyle: TextStyles.searchBarText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
