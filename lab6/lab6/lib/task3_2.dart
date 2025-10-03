import 'package:flutter/material.dart';

// Parent widget
class GreetingParent extends StatefulWidget {
  const GreetingParent({super.key});

  @override
  State<GreetingParent> createState() => _GreetingParentState();
}

class _GreetingParentState extends State<GreetingParent> {
  String _name = "Guest";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Greeting App")),
      body: Center(
        child: Greeting(name: _name), // Pass value down
      ),
    );
  }
}

// Child widget
class Greeting extends StatelessWidget {
  final String name;

  const Greeting({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text("Hello, $name",
        style: Theme.of(context).textTheme.headlineMedium);
  }
}
