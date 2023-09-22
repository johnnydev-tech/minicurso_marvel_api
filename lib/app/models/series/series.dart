import 'series_item.dart';

class Series {
  int available;
  String collectionURI;
  List<SeriesItem> items;

  Series({
    required this.available,
    required this.collectionURI,
    required this.items,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<SeriesItem> seriesItems =
        list.map((item) => SeriesItem.fromJson(item)).toList();

    return Series(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: seriesItems,
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
