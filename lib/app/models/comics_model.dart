class ComicsModel {
  final int available;
  final String collectionURI;

  ComicsModel({
    required this.available,
    required this.collectionURI,
  });

  factory ComicsModel.fromJson(Map<String, dynamic> json) {
    return ComicsModel(
      available: json['available'],
      collectionURI: json['collectionURI'],
    );
  }
}
