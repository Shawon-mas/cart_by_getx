import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color color;
  final VoidCallback onPressed;
  const ButtonWidget(
      {Key? key,
      required this.title,
      required this.width,
      required this.height,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        height: height,
        minWidth: width,
        color: Colors.white70,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: color, fontSize: 14, fontWeight: FontWeight.bold),
        ));
  }
}
