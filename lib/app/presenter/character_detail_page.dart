import 'package:flutter/material.dart';

import '../models/marvel_character.dart';

class CharacterDetailPage extends StatelessWidget {
  final MarvelCharacterModel character;
  const CharacterDetailPage({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              character.thumbnail.getThumbnailPath(),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
              fit: BoxFit.cover,
            ),
            Text(character.name),
            Text(character.description),
          ],
        ),
      ),
    );
  }
}
