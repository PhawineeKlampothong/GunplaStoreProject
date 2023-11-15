import 'dart:html';

import 'package:flutter/material.dart';

class BoxNews extends StatelessWidget {
  final String text;
  final IconData icon;
  final double size;
  final Color color;
  final Image img;



  const BoxNews({
    super.key,
    required this.text,
    required this.icon,
    required this.size,
    required this.color,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,borderRadius: BorderRadius.circular(10)
      ),
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,style: TextStyle(fontSize: 20),),
          Icon(icon),

        ],
      ),
    );
  }
}