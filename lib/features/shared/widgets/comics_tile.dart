import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_comics_app/core/text_styles.dart';
import 'package:marvel_comics_app/core/theme.dart';
import 'package:marvel_comics_app/features/shared/comics_utils.dart';

class ComicsTile extends StatelessWidget {
  const ComicsTile({super.key, required this.comic});
  final Map<String, dynamic> comic;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final String thumbnailUrl = ComicUtils.getThumbnailUrl(comic);
    final String creatorName = ComicUtils.getCreatorName(comic);
    final String description = ComicUtils.getDescription(comic);
    return InkWell(
      onTap: () => router.push('/comicDetails', extra: comic),
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: MarvelColors.comicTile,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.29,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    thumbnailUrl,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //title, author and description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
                    child: Text(
                      comic['title'],
                      style: TextStyles.comicTitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 0, 0),
                    child: Text(
                      'written by $creatorName',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.comicCreator,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 15, 5, 5),
                    child: Text(
                      description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.comicDescription,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
