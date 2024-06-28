import 'package:url_launcher/url_launcher.dart';

class ComicUtils {
  static String getThumbnailUrl(Map<String, dynamic> comic) {
    return "${comic['thumbnail']['path']}.${comic['thumbnail']['extension']}";
  }

  static String getCreatorName(Map<String, dynamic> comic) {
    final List<dynamic> creators = comic['creators']['items'];
    if (creators.isNotEmpty) {
      return creators[0]['name'];
    }
    return 'Unknown Creator';
  }

  static String getDescription(Map<String, dynamic> comic) {
    final List<dynamic> textObjects = comic['textObjects'];
    if (textObjects.isNotEmpty && textObjects[0]['text'] != null) {
      return textObjects[0]['text'];
    }
    return 'No Description Available';
  }

  static String getWebsiteUrl(Map<String, dynamic> comic) {
    final List<dynamic> comicUrl = comic['urls'];
    if (comicUrl.isNotEmpty) {
      return comicUrl[0]['url'];
    }
    return 'https://www.marvel.com/comics';
  }

  static Future<void> redirectToWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
