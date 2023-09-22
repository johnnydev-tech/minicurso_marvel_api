class SeriesItem {
  String resourceURI;
  String name;

  SeriesItem({
    required this.resourceURI,
    required this.name,
  });

  factory SeriesItem.fromJson(Map<String, dynamic> json) {
    return SeriesItem(
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
