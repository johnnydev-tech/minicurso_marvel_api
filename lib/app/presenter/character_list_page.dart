import 'package:flutter/material.dart';

import '../data/marvel_api.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  late Future<Map<String, dynamic>> characters;

  @override
  void initState() {
    super.initState();
    characters = MarvelApi.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens da Marvel'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: characters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            final characterList = snapshot.data!['results'] as List<dynamic>;

            return ListView.builder(
              itemCount: characterList.length,
              itemBuilder: (context, index) {
                final character = characterList[index];
                return ListTile(
                  title: Text(character['name'] as String),
                  // Adicione mais informações do personagem, como imagens, aqui.
                );
              },
            );
          }
        },
      ),
    );
  }
}
