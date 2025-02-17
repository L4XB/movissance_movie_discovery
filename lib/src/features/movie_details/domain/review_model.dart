class ReviewModel {
  final String author;
  final String authorName;
  final String authorUsername;
  final String authorAvatarPath;
  final double rating;
  final String content;

  ReviewModel({
    required this.author,
    required this.authorName,
    required this.authorUsername,
    required this.authorAvatarPath,
    required this.rating,
    required this.content,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      author: json["author"] ?? "",
      authorName: json["author_details"]["name"] ?? "",
      authorUsername: json["author_details"]["username"] ?? "",
      authorAvatarPath: json["author_details"]["avatar_path"] ?? "",
      rating: json["author_details"]["rating"] ?? 0.0,
      content: json["content"] ?? "",
    );
  }
}
