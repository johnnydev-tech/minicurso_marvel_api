import 'package:flutter/material.dart';

import '../data/marvel_api.dart';
import '../models/marvel_character_model.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
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
                  itemBuilder: (context, index) {
                    final marvelCharacter = characters[index];
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
              default:
                return const Center(child: Text('Carregando...'));
            }
          },
        ),
      ),
    );
  }
}
