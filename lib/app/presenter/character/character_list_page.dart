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
                      leading: Hero(
                        tag: marvelCharacter.id,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            marvelCharacter.thumbnail.getThumbnailPath,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(marvelCharacter.name),
                      subtitle: Text(
                          '${marvelCharacter.comics.available} quadrinhos'),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/character/detail',
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
