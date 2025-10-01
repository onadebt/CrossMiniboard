import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String text;
  final Color color;

  const Tile({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      color: color,
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
