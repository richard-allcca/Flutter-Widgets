import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  final List<Color> listColors;
  final List<double> listStops;

  const VideoBackground({
    super.key,
    this.listColors = const [
      Colors.transparent,
      Colors.black87
    ],
    this.listStops = const [0.5, 1.0],
  }): assert(
    listColors.length == listStops.length,
    'listStop and listColors must by same length'
  );

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: listColors,
            stops: listStops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
      ),
    );
  }
}