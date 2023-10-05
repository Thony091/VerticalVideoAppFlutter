import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_videos/config/theme/app_theme.dart';
import 'package:vertical_videos/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:vertical_videos/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:vertical_videos/presentation/providers/discover_provider.dart';
import 'package:vertical_videos/presentation/screen/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostsRepositoryImpl(
      videosDatasource: LocalVideoDatasource()
    ); 

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider( videoRepository: videoPostRepository )..loadNextPAge() 
        )// (..) OPERADOR DE CASCADA 
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VideosLokos',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),

    );
  }
}