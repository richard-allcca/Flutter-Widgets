

import 'package:widgets_app/domain/entities/video_post.dart';

abstract class VideoPostsRepository {


  Future<List<VideoPost>> getFavoriteVideoByUser( String userId);

  Future<List<VideoPost>> getTrendingVideosByPage( int page);
}