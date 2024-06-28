import 'package:flutter/material.dart';
import 'package:marvel_comics_app/core/text_styles.dart';
import 'package:marvel_comics_app/core/theme.dart';

class DetailsButton extends StatelessWidget {
  const DetailsButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(328, 52),
        backgroundColor: MarvelColors.detailsButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
        'Find out more',
        style: TextStyles.comicDetailsButton,
      ),
    );
  }
}
