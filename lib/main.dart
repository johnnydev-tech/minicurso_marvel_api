import 'package:flutter/material.dart';
import 'package:minicurso_marvel_api/shared/theme/custom_theme.dart';

import 'app/models/marvel_character_model.dart';
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
      theme: CustomTheme.darkTheme,
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
