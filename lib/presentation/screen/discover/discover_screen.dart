
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_videos/presentation/providers/discover_provider.dart';
import 'package:vertical_videos/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {

  
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {

  final discoverProvider = context.watch<DiscoverProvider>();//<...> Para que provider sepa cual es la instancia que me interesa recibir informacion

    return Scaffold(
      
      body: discoverProvider.initialLoading 
      ? const Center( child:  CircularProgressIndicator(strokeWidth: 2)) //Grosor de linea "StrokeWidth"
      : VideoScrollableView(videos: discoverProvider.videos)
    );
  }
}