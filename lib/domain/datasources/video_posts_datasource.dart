

import 'package:widgets_app/domain/entities/video_post.dart';

abstract class VideoPostsDataSource {


  Future<List<VideoPost>> getFavoriteVideoByUser( String userId);

  Future<List<VideoPost>> getTrendingVideosByPage( int page);
}