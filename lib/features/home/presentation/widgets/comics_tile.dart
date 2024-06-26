import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComicsTile extends StatelessWidget {
  const ComicsTile({super.key, required this.comic});
  final Map<String, dynamic> comic;

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comic['title'] ?? '',
            ),
            const SizedBox(height: 10),
            Text(
              comic['description'] ?? '',
            )
          ],
        ),
      ),
    );
  }
}
