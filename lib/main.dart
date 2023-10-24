import 'package:flutter/material.dart';

import 'app/models/marvel_character_model.dart';
import 'app/presenter/character/character_detail_page.dart';
import 'app/presenter/character/character_list_page.dart';
import 'app/presenter/home/home_page.dart';
import 'shared/theme/custom_theme.dart';

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
        '/': (context) => const HomePage(),
        '/character': (context) => const CharacterListPage(),
        '/character/detail': (context) => CharacterDetailPage(
              character: ModalRoute.of(context)!.settings.arguments
                  as MarvelCharacterModel,
            ),
      },
    );
  }
}
