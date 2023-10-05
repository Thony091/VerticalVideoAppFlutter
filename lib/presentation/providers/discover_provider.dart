

import 'package:flutter/material.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';
import 'package:vertical_videos/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videoRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoRepository
  });

  Future<void> loadNextPAge() async {

    await Future.delayed( const Duration(seconds: 2) );
    
    //guardar en "newVideos" un mètodo de map(devuelve iterable) que itera y guarda lo que le envien como argumento .
    //enviando callback,  enviamos una instancia de clase LocalVideoModel con su mètodo fromJsonMap y metodo mapeador de entidad y transformarlo en un lista ( toList() )
    /*
    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJsonMap(video).toVideoEntity()
    ).toList(); 
    */

    final newVideos = await videoRepository.getTrendingVideosByPage(1); 

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}