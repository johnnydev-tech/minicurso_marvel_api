import 'thumbnail_model.dart';

class MarvelCharacterModel {
  final int id;
  final String name;
  final String description;
  final String modified;
  final ThumbnailModel thumbnail;

  MarvelCharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
  });

  factory MarvelCharacterModel.fromJson(Map<String, dynamic> json) {
    return MarvelCharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      thumbnail: ThumbnailModel.fromJson(json['thumbnail']),
    );
  }
}