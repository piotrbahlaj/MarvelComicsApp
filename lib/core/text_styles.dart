import 'package:flutter/material.dart';

class TextStyles {
  // main screen
  static const TextStyle mainTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  static const TextStyle comicTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  static const TextStyle comicCreator = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );
  static const TextStyle comicDescription = TextStyle(
    fontSize: 14,
  );
  // details screen
  static const TextStyle detailScreenTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  static const TextStyle comicDetailsTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle comicDetailsCreator = TextStyle(
    color: Colors.grey.shade500,
  );
  static const TextStyle comicDetailsDescription = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle comicDetailsButton = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  // search screen
  static const TextStyle searchTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static const TextStyle searchErrorMessage = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static TextStyle searchBarText = TextStyle(
    color: Colors.grey.shade500,
  );
}
