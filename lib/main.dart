import 'package:flutter/material.dart';

import 'app/models/marvel_character.dart';
import 'app/presenter/character_detail_page.dart';
import 'app/presenter/character_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel API  - Minicurso',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CharacterListPage(),
        '/detail': (context) => CharacterDetailPage(
              character: ModalRoute.of(context)!.settings.arguments
                  as MarvelCharacterModel,
            ),
      },
    );
  }
}
