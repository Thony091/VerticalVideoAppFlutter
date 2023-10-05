
  import 'package:vertical_videos/domain/datasource/video_post_datasource.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';

import '../../shared/data/local_video_post.dart';
import '../models/local_video_model.dart';

class LocalVideoDatasource implements VideoPostDataSource{
  
  @override
  Future<List<VideoPost>> getFavouriteVideosByUser(String userID) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async{
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJsonMap(video).toVideoEntity()
    ).toList(); 

    return newVideos;
  }


}


