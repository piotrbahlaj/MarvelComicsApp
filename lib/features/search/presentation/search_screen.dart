import 'package:flutter/material.dart';
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
            )
          ],
        ),
      ),
    );
  }
}
