import 'package:flutter/material.dart';

// Grandparent
class Grandparent extends StatefulWidget {
  const Grandparent({super.key});

  @override
  State<Grandparent> createState() => _GrandparentState();
}

class _GrandparentState extends State<Grandparent> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prop Drilling Example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter: $_counter",
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          Parent(counter: _counter, onIncrement: _increment),
        ],
      ),
    );
  }
}

// Parent
class Parent extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;

  const Parent({super.key, required this.counter, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Child(counter: counter, onIncrement: onIncrement);
  }
}

// Child
class Child extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;

  const Child({super.key, required this.counter, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onIncrement,
      child: const Text("Increment from Child"),
    );
  }
}
