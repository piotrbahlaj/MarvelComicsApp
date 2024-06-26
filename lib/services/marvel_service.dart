import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MarvelService {
  final String publicKey;
  final String privateKey;
  final String baseUrl = 'https://gateway.marvel.com/v1/public/';

  MarvelService()
      : publicKey = dotenv.env['API_KEY'] ?? '',
        privateKey = dotenv.env['PRIVATE_KEY'] ?? '' {
    if (publicKey.isEmpty || privateKey.isEmpty) {
      throw Exception(
          'API_KEY and PRIVATE_KEY must be provided in the .env file.');
    }
  }

  String _generateHash(String ts) {
    return md5.convert(utf8.encode(ts + privateKey + publicKey)).toString();
  }

  Future<Map<String, dynamic>> fetchComics() async {
    final String ts = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = _generateHash(ts);

    final url =
        Uri.parse('${baseUrl}comics?ts=$ts&apikey=$publicKey&hash=$hash');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load comics');
    }
  }
}
