class ThumbnailModel {
  final String path;
  final String extension;

  ThumbnailModel({
    required this.path,
    required this.extension,
  });

  String get getThumbnailPath {
    return '$path.$extension';
  }

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) {
    return ThumbnailModel(
      path: json['path'],
      extension: json['extension'],
    );
  }
}
