
import 'package:flutter/material.dart';
import 'package:widgets_app/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomButton(
          value: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red
        ),
        _CustomButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined
        ),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomButton({
    required this.value,
    required this.iconData,
    iconColor
  }): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: (){},
          icon: Icon(iconData, color: Colors.red, size: 30,),
        ),
        Text('$value k')
      ],
    );
  }
}