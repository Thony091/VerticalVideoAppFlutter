


import 'package:vertical_videos/domain/entities/video_post.dart';

abstract class VideoPostRepository {

  // Exige(al implementar) regresar un "future" que regrese una lista de VideoPost y pide el "userID" 
  Future<List<VideoPost>> getFavouriteVideosByUser( String userID );

  // Exige(al implementar) regresar un "future" que regrese una lista de VideoPost y pide una "página" como argumento
  Future<List<VideoPost>> getTrendingVideosByPage( int page );

  
  
} 