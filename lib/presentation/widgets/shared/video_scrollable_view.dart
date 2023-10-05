
import 'package:flutter/material.dart';
import 'package:vertical_videos/domain/entities/video_post.dart';
import 'package:vertical_videos/presentation/widgets/shared/video_buttons.dart';
import 'package:vertical_videos/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;
  const VideoScrollableView({
    super.key, 
    required this.videos}
  );

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical, // Scroll de forma vertical

      itemCount: videos.length ,

      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            // video + gradiente
            SizedBox.expand(  //".expand" para que tome todo el tamaño de la pantalla
              child: FullScreenPlayer(
                videoUrl: videoPost.videoUrl, 
                caption: videoPost.caption
              ),
            ),
            // FullScreenPlayer(video: videoPost),

            //botones
            Positioned( // wdg controlador de posiciones
              bottom: 40,//posiciòn abajo
              right: 20, //posición de la derecha
              child: VideoButtons(video: videoPost,))
          ],
        );
      },
    );
  }
}