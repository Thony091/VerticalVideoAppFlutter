

import 'package:flutter/material.dart';

class VideoBackGround extends StatelessWidget {

  final List<Color> colors;
  final List<double> stops;

  const VideoBackGround({
    super.key, 
    this.colors = const [
      Colors.transparent,
      Colors.black87
    ], 
    this.stops = const[ 0.0 , 1.0 ]
  }): assert(colors.length == stops.length, 'Stops and Colors must be same length');

  @override
  Widget build(BuildContext context) {
    return Positioned.fill( // "".fill" toma todo el espacio posible 
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.topCenter, //indica el comienzo del gradiente (arriba centro)
            end: Alignment.bottomCenter //indica el fin del gradiente (abajo centro)
          )
        )
      ) 
    );
  }
}