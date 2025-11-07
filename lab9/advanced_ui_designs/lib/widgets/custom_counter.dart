import 'package:flutter/material.dart';

class CustomCounter extends StatefulWidget{
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState()=>_CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter>{
  int _count=0;

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: ()=>setState(()=>_count--),
          icon: const Icon(Icons.remove),
        ),
        Text(
          '$_count',
          style: const TextStyle(fontSize: 24),
        ),
        IconButton(
          onPressed: ()=>setState(()=>_count++),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}