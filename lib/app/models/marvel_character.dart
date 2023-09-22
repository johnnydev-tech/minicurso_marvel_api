import 'comics/comic.dart';
import 'series/series.dart';
import 'thumbnail.dart';

class MarvelCharacter {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceURI;
  Comics comics;
  Series series;

  MarvelCharacter({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceURI,
    required this.comics,
    required this.series,
  });





  

  factory MarvelCharacter.fromJson(Map<String, dynamic> json) {
    return MarvelCharacter(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      thumbnail: Thumbnail.fromJson(json['thumbnail']),
      resourceURI: json['resourceURI'],
      comics: Comics.fromJson(json['comics']),
      series: Series.fromJson(json['series']),
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
      'comics': comics.toJson(),
      'series': series.toJson(),
    };
  }
}
