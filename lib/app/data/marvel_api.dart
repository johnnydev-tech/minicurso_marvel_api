import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:minicurso_marvel_api/shared/keys/api_keys.dart';

class MarvelApi {
  static const String baseUrl = 'https://gateway.marvel.com/v1/public';
  static const String charactersEndpoint = '/characters';

  static const String marvelPublicKey = ApiKeys.marvelPublicKey;
  static const String marvelPrivateKey = ApiKeys.marvelPrivateKey;

  static String _generateHash(String timeStamp) {
    final bytes = utf8.encode('$timeStamp$marvelPrivateKey$marvelPublicKey');
    final digest = md5.convert(bytes);
    return digest.toString();
  }

  static Future<Map<String, dynamic>> getCharacters() async {
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _generateHash(timeStamp);

    final response = await http.get(
      Uri.parse(
          '$baseUrl$charactersEndpoint?ts=$timeStamp&apikey=$marvelPublicKey&hash=$hash'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      return jsonData['data'];
    } else {
      throw Exception('Falha ao carregar personagens da Marvel');
    }
  }
}
