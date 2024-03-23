import 'package:flutter/material.dart';
import 'package:widgets_app/domain/entities/video_post.dart';
import 'package:widgets_app/infrastructure/model/videos_model.dart';
import 'package:widgets_app/shared/data/local_video_posts.dart';


class DiscoverProvider extends ChangeNotifier {

  bool initialLoading = true;
  List<VideoPost> videos = [];

  // NextPage para deslizar al siguiente video
  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideosModel.fromJsonMap(video).toVideoEntity(),
    ).toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}