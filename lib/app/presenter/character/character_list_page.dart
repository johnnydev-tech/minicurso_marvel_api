import 'package:flutter/material.dart';

import '../../data/marvel_api.dart';
import '../../models/marvel_character_model.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final ScrollController _scrollController = ScrollController();
  List<MarvelCharacterModel> characters = [];
  int page = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
    _loadData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      final newCharacters = await MarvelApi.getCharacters(page);

      setState(() {
        isLoading = false;
        characters.addAll(newCharacters);
        page++;
      });
    }
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  Widget loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: characters.isEmpty
          ? loadingIndicator()
          : ListView.builder(
              controller: _scrollController,
              itemCount: characters.length + 1,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                if (index < characters.length) {
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
                } else {
                  return loadingIndicator();
                }
              },
            ),
    );
  }
}
