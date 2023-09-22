import 'comic_item.dart';

class Comics {
  int available;
  String collectionURI;
  List<ComicItem> items;

  Comics({
    required this.available,
    required this.collectionURI,
    required this.items,
  });

  factory Comics.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<ComicItem> comicItems =
        list.map((item) => ComicItem.fromJson(item)).toList();

    return Comics(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: comicItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'collectionURI': collectionURI,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}
