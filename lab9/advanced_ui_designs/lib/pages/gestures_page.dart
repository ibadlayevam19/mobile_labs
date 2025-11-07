import 'package:flutter/material.dart';

class GesturesPage extends StatefulWidget{
  const GesturesPage({super.key});

  @override
  State<GesturesPage> createState()=> _GesturesPageState();
}

class _GesturesPageState extends State<GesturesPage>{
  Color _bgColor=Colors.blueGrey;

  void _changeColor(Color color) => setState(()=> _bgColor=color);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: ()=> _changeColor(Colors.green),
      onDoubleTap: () => _changeColor(Colors.orange),
      onLongPress: ()=> _changeColor(Colors.red),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _bgColor,
        child: const Center(
          child: Text(
            'Tap, Double Tap, or Long Press',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }
}