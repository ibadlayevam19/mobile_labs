import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget{
  @override
  State<CounterApp> createState()=>_CounterAppState();
}

class _CounterAppState extends State<CounterApp>{
  int counter=0;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('$counter')),
        floatingActionButton: FloatingActionButton(
          key: Key('increment'),
          onPressed: ()=>setState(()=>counter++),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}