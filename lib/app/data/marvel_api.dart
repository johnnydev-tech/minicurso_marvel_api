import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../shared/keys/api_keys.dart';
import '../models/marvel_character_model.dart';

class MarvelApi {
  static const String baseUrl = 'https://gateway.marvel.com/v1/public';

  static const String marvelPublicKey = ApiKeys.marvelPublicKey;
  static const String marvelPrivateKey = ApiKeys.marvelPrivateKey;

  static String _generateHash(String timeStamp) {
    final bytes = utf8.encode('$timeStamp$marvelPrivateKey$marvelPublicKey');
    final digest = md5.convert(bytes);
    return digest.toString();
  }

  static Future<List<MarvelCharacterModel>> getCharacters() async {
    const String charactersEndpoint = '/characters';

    final now = DateTime.now();
    final timeStamp = now.millisecondsSinceEpoch.toString();
    final hash = _generateHash(timeStamp);

    final url = Uri.parse(
        '$baseUrl$charactersEndpoint?ts=$timeStamp&apikey=$marvelPublicKey&hash=$hash');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        Map<String, dynamic> data = jsonData['data'];
        final results = data['results'];

        List<MarvelCharacterModel> characters = results
            .map<MarvelCharacterModel>(
                (character) => MarvelCharacterModel.fromJson(character))
            .toList();

        return characters;
      } else {
        debugPrint(
            'STATUS CODE: ${response.statusCode}\nBODY:${response.body}');
        throw Exception('Falha ao carregar personagens da Marvel');
      }
    } catch (e) {
      throw Exception('Falha ao carregar personagens da Marvel');
    }
  }
}
