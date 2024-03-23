import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_app/presentation/provider/discover_provider.dart';
import 'package:widgets_app/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Consumo de contexto con método original
    // final discoverProvider = Provider.of<DiscoverProvider>(context, listen: false);

    // Consumo de contexto con método nuevo
    final discoverProvider = context.read<DiscoverProvider>();

    return Scaffold(
      body: discoverProvider.initialLoading
        ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
        : VideoScrollableView(videos: discoverProvider.videos)
    );
  }
}