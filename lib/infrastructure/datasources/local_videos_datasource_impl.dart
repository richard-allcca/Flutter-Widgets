

import 'package:widgets_app/domain/datasources/video_posts_datasource.dart';
import 'package:widgets_app/domain/entities/video_post.dart';
import 'package:widgets_app/infrastructure/model/videos_model.dart';
import 'package:widgets_app/shared/data/local_video_posts.dart';

// INFO - Esta clase que implementa una abstracta debe tener la misma estructura (métodos)

class LocalVideosDataSourceImpl implements VideosPostsDataSource {

  @override
  Future<List<VideoPost>> getFavoriteVideoByUser(String userId) {
    // without implement - only demo
    throw UnimplementedError();
  }

  // INFO - Método para obtener videos locales
  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = localVideoList.map(
      (video) =>  LocalVideosModel.fromJsonMap(video).toVideoEntity()
    ).toList();

    return newVideos;
  }

}