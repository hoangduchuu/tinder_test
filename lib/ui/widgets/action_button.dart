import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
enum ActionButtonType { back, dislike, superLike, like, speedUp }

class ActionButton extends StatefulWidget {
  const ActionButton({
    Key? key,
    required this.image,
    required this.color,
    this.height = 60,
    this.iconSize = 30.0,
    this.background,
    this.onTap,
  }) : super(key: key);
  final String image;
  final Color color;
  final double height;
  final double iconSize;
  final Color? background;
  final VoidCallback? onTap;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  double height = 0.0;

  @override
  void initState() {
    super.initState();
    height = widget.height;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: height,
        width: height,
        child: Center(
          child: Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              color: widget.background,
              border: Border.all(color: widget.color),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                widget.image,
                height: widget.iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
