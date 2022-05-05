import 'package:flutter/material.dart';

class NopeWidget extends StatelessWidget {
  const NopeWidget({Key? key, required this.align}) : super(key: key);
  final double align;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      child: Transform.rotate(
        angle: -100,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xfffe3c72), width: 8.0, style: BorderStyle.solid), //Border.all
            /*** The BorderRadius widget  is here ***/
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ), //BorderRadius.all
          ), //Box
          child: const Text(
            'NOPE',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xfffe3c72)),
          ),
        ),
      ),
      opacity: _getOpacity(align),
    );
  }

  double _getOpacity(double align) {
    var abs = align.abs() / 10;
    return abs > 1 ? 1 : abs;
  }
}
