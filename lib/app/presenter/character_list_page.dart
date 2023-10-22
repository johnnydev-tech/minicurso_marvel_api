import 'package:flutter/material.dart';
import 'package:minicurso_marvel_api/app/models/marvel_character_model.dart';

import '../data/marvel_api.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens da Marvel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<MarvelCharacterModel>>(
          future: MarvelApi.getCharacters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data == null) {
              return Text('Erro: ${snapshot.error}');
            } else {
              final characters = snapshot.data;

              return ListView.builder(
                itemCount: characters!.length,
                itemBuilder: (context, index) {
                  MarvelCharacterModel marvelCharacter = characters[index];
                  return ListTile(
                    leading: Image.network(
                      marvelCharacter.thumbnail.getThumbnailPath,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(marvelCharacter.name),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: marvelCharacter,
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
