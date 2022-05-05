import 'package:flutter/material.dart';

class NopeWidget extends StatelessWidget {
  NopeWidget({Key? key, required this.align}) : super(key: key);
  final double align;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      child: Image.network('https://statics.voz.tech/styles/next/xenforo/smilies/popopo/sweat_x2.png?v=01'),
      opacity: _getOpacity(align),
    );
  }

  double _getOpacity(double align) {
    var abs = align.abs() / 10;
    return abs > 1 ? 1 : abs;
  }
}
