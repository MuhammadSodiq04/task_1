//"postId": 1,
// "id": 1,
// "name": "id labore ex et quam laborum",
// "email": "Eliseo@gardner.biz",
// "body": "laudantium enim qua

class CommentsModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentsModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    return CommentsModel(
      postId: json["postId"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      email: json["email"] as String? ?? "",
      body: json["body"] as String? ?? "",
    );
  }
}
