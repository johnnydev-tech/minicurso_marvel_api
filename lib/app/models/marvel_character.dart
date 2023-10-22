import 'thumbnail.dart';

class MarvelCharacterModel {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceURI;

  MarvelCharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceURI,
  });

  factory MarvelCharacterModel.fromJson(Map<String, dynamic> json) {
    return MarvelCharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      thumbnail: Thumbnail.fromJson(json['thumbnail']),
      resourceURI: json['resourceURI'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'modified': modified,
      'thumbnail': thumbnail.toJson(),
      'resourceURI': resourceURI,
    };
  }
}
