import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:vertical_videos/config/helpers/human_format.dart';

import '../../../domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
 
  final VideoPost video;

  const VideoButtons({
    super.key,

    required this.video
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton( values: video.likes, iconData: Icons.favorite, iconColor: Colors.redAccent ), 
        const SizedBox(height: 20,),
        _CustomIconButton( values: video.views, iconData: Icons.remove_red_eye_sharp, ),
        const SizedBox(height: 20,),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton( values: 0, iconData: Icons.play_circle_fill_outlined, ))
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int values;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    super.key,
    required this.values,
    required this.iconData,
    iconColor //variable que servira para reemplazará al atributo de la clase
    }): color = iconColor ?? Colors.white; //tomará color blanco si no se le asigna color 

  @override
  Widget build(BuildContext context) {
  
  return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon( iconData, color: color, size: 30, )),
          
          if( values > 0)
          Text( HumanFormats.humanReadbleNumer( values.toDouble() ) ),      //Damos formato al valor del atributo de clase "values"  
      ],
    );
  }
}