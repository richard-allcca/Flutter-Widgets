import 'package:flutter/material.dart';
import 'package:widgets_app/domain/entities/video_post.dart';
import 'package:widgets_app/infrastructure/repositories/videos_posts_repository_impl.dart';

// INFO - Provider for tok tik application

class DiscoverProvider extends ChangeNotifier {

  final VideosPostRepositoryImpl videoRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoRepository
  });

  // NextPage para deslizar al siguiente video
  Future<void> loadNextVideo() async {
    // await Future.delayed(const Duration(seconds: 2));

    // Without datasource and repository
    // final List<VideoPost> newVideos = localVideoPost.map(
    //   (video) => LocalVideosModel.fromJsonMap(video).toVideoEntity(),
    // ).toList();

    final newVideos = await videoRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}