import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComicsTile extends StatelessWidget {
  const ComicsTile({super.key});

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
        child: const SizedBox(
          height: 220,
          width: 300,
        ),
        // child: ListView.builder(
        //   itemCount: 20, // Replace with your actual item count
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text('Item $index'),
        //       subtitle: Text('Description of Item $index'),
        //       leading: const Icon(Icons.star),
        //       trailing: const Icon(Icons.arrow_forward),
        //       onTap: () {},
        //     );
        //   },
        // ),
      ),
    );
  }
}
