class ComicItem {
  String resourceURI;
  String name;

  ComicItem({
    required this.resourceURI,
    required this.name,
  });

  factory ComicItem.fromJson(Map<String, dynamic> json) {
    return ComicItem(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }
}
