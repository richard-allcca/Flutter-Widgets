


import 'package:widgets_app/domain/repositories/video_posts_repository.dart';
import 'package:widgets_app/domain/datasources/video_posts_datasource.dart';
import 'package:widgets_app/domain/entities/video_post.dart';


class VideosPostRepositoryImpl implements VideoPostsRepository {

  final VideosPostsDataSource videosDatasource;

  VideosPostRepositoryImpl({
    required this.videosDatasource
  });

  @override
  Future<List<VideoPost>> getFavoriteVideoByUser(String userId) {
    // without implement - only demo
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {

    return videosDatasource.getTrendingVideosByPage(page);

  }


}