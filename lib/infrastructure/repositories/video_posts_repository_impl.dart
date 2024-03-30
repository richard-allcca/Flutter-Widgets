


import 'package:widgets_app/domain/repositories/video_posts_repository.dart';
import 'package:widgets_app/domain/datasources/video_posts_datasource.dart';
import 'package:widgets_app/domain/entities/video_post.dart';


class VideoPostRepositoryImpl implements VideoPostsRepository {

  final VideoPostsDataSource videoDatasource;

  VideoPostRepositoryImpl({
    required this.videoDatasource
  });

  @override
  Future<List<VideoPost>> getFavoriteVideoByUser(String userId) {
    // without implement - only demo
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {

    return videoDatasource.getTrendingVideosByPage(page);

  }


}