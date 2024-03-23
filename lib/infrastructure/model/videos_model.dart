

import 'package:widgets_app/domain/entities/video_post.dart';

class LocalVideosModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideosModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideosModel.fromJsonMap(Map<String, dynamic> json) => LocalVideosModel(
      name: json["name"] ?? 'No name',
      videoUrl: json["videoUrl"],
      likes: json["likes"] ?? 0,
      views: json["views"] ?? 0,
    );

  VideoPost toVideoEntity() => VideoPost(
    caption: name,
    videoUrl: videoUrl,
    likes: likes,
    views: views,
  );

}