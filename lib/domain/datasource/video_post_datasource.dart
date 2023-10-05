


import 'package:vertical_videos/domain/entities/video_post.dart';

abstract class VideoPostDataSource {

  Future <List<VideoPost>> getFavouriteVideosByUser( String userID );   // Exige(al implementar) regresar un "future" que regrese una lista de VideoPost y pide el "userID" 

  Future <List<VideoPost>> getTrendingVideosByPage( int page );   // Exige(al implementar) regresar un "future" que regrese una lista de VideoPost y pide una "página" como argumento
  
} 