import 'package:flutter/material.dart';
import 'package:minicurso_marvel_api/shared/theme/palette.dart';

import '../../models/marvel_character_model.dart';

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
      body: Column(
        children: [
          Hero(
            tag: character.id,
            child: Image.network(
              character.thumbnail.getThumbnailPath,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .4,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Hero(
                  tag: '${character.id}name',
                  child: Text(
                    character.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  character.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        color: Palette.darkAccent,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                child: const Text('Action'),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.favorite),
                label: const Text('Favoritar'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
