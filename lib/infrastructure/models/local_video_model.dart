
import 'package:vertical_videos/domain/entities/video_post.dart';

class LocalVideoModel {

  final String name; 
  final String videoUrl; 
  final int likes; 
  final int views; 

  //Constructor
  LocalVideoModel({
    required this.name, 
    required this.videoUrl, 
    this.likes = 0, 
    this.views = 0, 

  });

  // para crear una instancia de la clase al recibir una respuesta http
  factory LocalVideoModel.fromJsonMap( Map<String, dynamic> json) => LocalVideoModel(
    name : json['name'] ?? ' No video Name', // (?? 'sdfhsbdfj') para establecer un valor por defecto
    videoUrl: json['videoUrl'], 
    likes   : json['likes'] ?? 0, 
    views   : json['views'] ?? 0
  );

  // Para mapear los videos usando la clase VideoPost (Capa dominio)
  VideoPost toVideoEntity() => VideoPost(
    caption: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views
    );


}