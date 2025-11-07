import 'package:flutter/material.dart';
class CustomTitle extends StatelessWidget{
  final String text;
  final Color color;

  const CustomTitle({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}