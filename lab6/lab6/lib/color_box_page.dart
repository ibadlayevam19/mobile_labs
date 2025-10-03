import 'package:flutter/material.dart';

class ColorBoxPage extends StatefulWidget {
  const ColorBoxPage({super.key});

  @override
  State<ColorBoxPage> createState() => _ColorBoxPageState();
}

class _ColorBoxPageState extends State<ColorBoxPage> {
  Color _boxColor = Colors.grey;

  void _changeColor(Color color) {
    setState(() {
      _boxColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color Box")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: _boxColor,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _changeColor(Colors.red),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Red"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _changeColor(Colors.green),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text("Green"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _changeColor(Colors.blue),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("Blue"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
