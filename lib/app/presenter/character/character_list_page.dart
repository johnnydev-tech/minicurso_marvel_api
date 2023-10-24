import 'package:flutter/material.dart';

import '../../data/marvel_api.dart';
import '../../models/marvel_character_model.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<MarvelCharacterModel>>(
        future: MarvelApi.getCharacters(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError || snapshot.data == null) {
                return Text('Erro: ${snapshot.error}');
              }
              final characters = snapshot.data!;
              return ListView.builder(
                itemCount: characters.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return ListTile(
                    leading: Hero(
                      tag: character.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          character.thumbnail.getThumbnailPath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Hero(
                      tag: '${character.id}name',
                      child: Text(
                        character.name,
                      ),
                    ),
                    subtitle: Text(
                      '${character.comics.available} quadrinhos',
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/character/detail',
                        arguments: character,
                      );
                    },
                  );
                },
              );
            default:
              return const Center(child: Text('Carregando...'));
          }
        },
      ),
    );
  }
}
