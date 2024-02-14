//"albumId": 1,
// "id": 1,
// "title": "accusamus beatae ad facilis cum similique qui sunt",
// "url": "https://via.placeholder.com/600/92c952",
// "thumbnailUrl": "https://via.placeholder.com/150/92c952"

class PhotosModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return PhotosModel(
      albumId: json["albumId"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      url: json["url"] as String? ?? "",
      thumbnailUrl: json["thumbnailUrl"] as String? ?? "",
    );
  }
}
