import 'package:widgets_app/domain/entities/video_post.dart';

// INFO - Esta clase abstracta sirve como plantilla para la clase que implemente o extienda de esta tengo obligatoriamente la misma estructura (métodos)

abstract class VideosPostsDataSource {


  Future<List<VideoPost>> getFavoriteVideoByUser( String userId);

  Future<List<VideoPost>>  getTrendingVideosByPage( int page);
}