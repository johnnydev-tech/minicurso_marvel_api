import 'thumbnail.dart';

class MarvelCharacterModel {
  final int id;
  final String name;
  final String description;
  final String modified;
  final Thumbnail thumbnail;

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
      thumbnail: Thumbnail.fromJson(json['thumbnail']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'modified': modified,
      'thumbnail': thumbnail.toJson(),
    };
  }
}
