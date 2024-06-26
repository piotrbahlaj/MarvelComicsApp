import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComicsTile extends StatelessWidget {
  const ComicsTile({super.key, required this.comic});
  final Map<String, dynamic> comic;

  @override
  Widget build(BuildContext context) {
    final String thumbnailUrl =
        "${comic['thumbnail']['path']}.${comic['thumbnail']['extension']}";
    final router = GoRouter.of(context);
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

            //title and description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
                    child: Text(
                      comic['title'] ?? 'No Title',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    comic['description'] ?? 'No Description',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
