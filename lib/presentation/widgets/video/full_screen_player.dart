import 'package:flutter/material.dart';
import 'package:vertical_videos/presentation/widgets/video/gradient_video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key, 
    required this.videoUrl, 
    required this.caption
    });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future:  controller.initialize(),
      builder: (context, snapshot) {

        if(snapshot.connectionState != ConnectionState.done){
        return const Center(child: CircularProgressIndicator(strokeWidth: 1, color: Colors.redAccent,),);
      }

      return GestureDetector(   //detectar gestos de la pantalla
        onTap: () {   //al dar tap
          if(controller.value.isPlaying){ //Condicional (Si el valor(video) está en play)
            controller.pause();   //pausar video
            return;
          }
          controller.play();// dar play
        },
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,  //aspecto del video
          child: Stack( // Posicionamiento, delante o detras
            children: [
              VideoPlayer(controller),
      
              //Gradiente
              VideoBackGround(
                stops: const [ 0.8, 1.0 ],
              ),
              //Texto
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption)
                )
            ],
          ), //Controlador
          ),
      );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  
  final String caption;
  
  const _VideoCaption({
    super.key, 
    required this.caption
  });
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final tittleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text( caption, maxLines: 2, style: tittleStyle,),
    );
  }
}