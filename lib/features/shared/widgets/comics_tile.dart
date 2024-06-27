import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          color: Colors.white,
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
              width: 150,
              height: 250,
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
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
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 15, 5, 5),
                    child: Text(
                      description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
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