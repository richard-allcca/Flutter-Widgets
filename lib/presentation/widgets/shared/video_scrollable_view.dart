import 'package:flutter/material.dart';
import 'package:widgets_app/domain/entities/video_post.dart';
import 'package:widgets_app/presentation/widgets/shared/video_buttons.dart';
import 'package:widgets_app/presentation/widgets/video/fullscreen_player.dart';

// NOTE - Example create views to video in list

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            // Video player + gradiente
            SizedBox.expand(
              child: FullScreenPlayer(videoUrl: videoPost.videoUrl, caption: videoPost.caption),
            ),

            // Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost )
            )
          ],
        );
      },
    );
  }
}