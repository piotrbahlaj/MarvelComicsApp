import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MarvelService {
  final String publicKey = dotenv.env['API_KEY'] ?? '';
  final String privateKey = dotenv.env['PRIVATE_KEY'] ?? '';
  final String baseUrl = 'https://gateway.marvel.com/v1/public/';

  MarvelService() {
    if (publicKey.isEmpty || privateKey.isEmpty) {
      throw Exception(
          'API_KEY and PRIVATE_KEY must be provided in the .env file.');
    }
  }

  String _generateHash(String ts) {
    return md5.convert(utf8.encode(ts + privateKey + publicKey)).toString();
  }

  Future<List<dynamic>> searchComics(String query) async {
    final String ts = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = _generateHash(ts);
    final searchUrl = Uri.parse(
        '$baseUrl/comics?titleStartsWith=$query&apikey=$publicKey&ts=$ts&hash=$hash');

    final response = await http.get(searchUrl);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['data']['results'];
      return results;
    } else {
      throw Exception('Failed to load search results');
    }
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
