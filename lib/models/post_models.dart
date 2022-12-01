// To parse this JSON data, do
//
//     final postModel = postModelFromMap(jsonString);

import 'dart:convert';

PostModel postModelFromMap(String str) => PostModel.fromMap(json.decode(str));

String postModelToMap(PostModel data) => json.encode(data.toMap());

class PostModel {
  PostModel({
    required this.createdAt,
    required this.authorId,
    required this.authorName,
    required this.description,
    required this.media,
    required this.likeCount,
    required this.disLikeCount,
    required this.authorProfileImage,
    required this.id,
    required this.comments,
    required this.postId,
  });

  final DateTime? createdAt;
  final String? authorId;
  final String? authorName;
  final String? description;
  final String? media;
  final int? likeCount;
  final int? disLikeCount;
  final String? authorProfileImage;
  final String? id;
  final List<PostModel>? comments;
  final String? postId;

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        authorId: json["authorId"] == null ? null : json["authorId"],
        authorName: json["authorName"] == null ? null : json["authorName"],
        description: json["description"] == null ? null : json["description"],
        media: json["media"] == null ? null : json["media"],
        likeCount: json["likeCount"] == null ? null : json["likeCount"],
        disLikeCount:
            json["disLikeCount"] == null ? null : json["disLikeCount"],
        authorProfileImage: json["authorProfileImage"] == null
            ? null
            : json["authorProfileImage"],
        id: json["id"] == null ? null : json["id"],
        comments: json["comments"] == null
            ? null
            : List<PostModel>.from(
                json["comments"].map((x) => PostModel.fromMap(x))),
        postId: json["postId"] == null ? null : json["postId"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "authorId": authorId == null ? null : authorId,
        "authorName": authorName == null ? null : authorName,
        "description": description == null ? null : description,
        "media": media == null ? null : media,
        "likeCount": likeCount == null ? null : likeCount,
        "disLikeCount": disLikeCount == null ? null : disLikeCount,
        "authorProfileImage":
            authorProfileImage == null ? null : authorProfileImage,
        "id": id == null ? null : id,
        "comments": comments == null
            ? null
            : List<dynamic>.from(comments!.map((x) => x.toMap())),
        "postId": postId == null ? null : postId,
      };
}
