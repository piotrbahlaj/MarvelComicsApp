import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_comics_app/features/comic_details/presentation/widgets/details_button.dart';
import 'package:marvel_comics_app/features/comic_details/presentation/widgets/expandable_tile.dart';

class ComicDetailsScreen extends StatelessWidget {
  const ComicDetailsScreen({super.key, required this.comic});
  final Map<String, dynamic> comic;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
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
            child: ExpandableContainer(
              title: comic['title'],
              creators: 'written by $creatorName',
              description: description,
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 15,
            right: 15,
            child: DetailsButton(),
          ),
        ],
      ),
    );
  }
}
