import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_comics_app/core/text_styles.dart';
import 'package:marvel_comics_app/features/comic_details/presentation/widgets/details_button.dart';
import 'package:marvel_comics_app/features/comic_details/presentation/widgets/expandable_tile.dart';
import 'package:marvel_comics_app/features/shared/comics_utils.dart';

class ComicDetailsScreen extends StatelessWidget {
  const ComicDetailsScreen({super.key, required this.comic});
  final Map<String, dynamic> comic;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final String thumbnailUrl = ComicUtils.getThumbnailUrl(comic);
    final String creatorName = ComicUtils.getCreatorName(comic);
    final String description = ComicUtils.getDescription(comic);
    final String comicUrl = ComicUtils.getWebsiteUrl(comic);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'Details',
          style: TextStyles.detailScreenTitle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            router.pop(context);
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.network(
              thumbnailUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ExpandableTile(
              title: comic['title'],
              creators: 'written by $creatorName',
              description: description,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 15,
            right: 15,
            child: DetailsButton(
              onPressed: () {
                ComicUtils.redirectToWebsite(comicUrl);
              },
            ),
          ),
        ],
      ),
    );
  }
}
