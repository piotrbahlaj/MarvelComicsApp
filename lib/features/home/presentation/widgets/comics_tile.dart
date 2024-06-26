import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComicsTile extends StatelessWidget {
  const ComicsTile({super.key, required this.comic});
  final Map<String, dynamic> comic;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    //image url
    final String thumbnailUrl =
        "${comic['thumbnail']['path']}.${comic['thumbnail']['extension']}";
    //creators name
    final List<dynamic> creators = comic['creators']['items'];
    String creatorName = 'Unknown Creator';
    if (creators.isNotEmpty) {
      creatorName = creators[0]['name'];
    }
    //description
    String description = 'No Description Available';
    final List<dynamic> textObjects = comic['textObjects'];
    if (textObjects.isNotEmpty) {
      description = textObjects[0]['text'] ?? 'No Description Available';
    }
    return InkWell(
      onTap: () => router.go('/comicDetails'),
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
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Container(
              width: 150,
              height: 220,
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
                        fontSize: 14,
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
                    padding: const EdgeInsets.fromLTRB(16, 5, 5, 5),
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
