import 'package:flutter/material.dart';
import 'package:minicurso_marvel_api/app/presenter/character/character_list_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Quadrinhos',
                ),
                Tab(
                  text: 'Personagens',
                ),
              ],
            ),
            title: const Text('Explorar')),
        body: TabBarView(
          children: [
            Center(
              child: Text('Quadrinhos'),
            ),
            CharacterListPage(),
          ],
        ),
      ),
    );
  }
}
