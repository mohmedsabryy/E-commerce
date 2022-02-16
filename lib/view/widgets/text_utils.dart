import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final Color color ;
  final double fontsize;
  final FontWeight fontWeight;
  final TextDecoration underline;


  const TextUtils({
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    required this.color,
    required this.underline,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,

      style: TextStyle(
        color: color,
        decoration:underline,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),

    );
  }
}
