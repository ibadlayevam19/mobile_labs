import 'package:flutter/material.dart';

class ToggleVisibilityPage extends StatefulWidget {
  const ToggleVisibilityPage({super.key});

  @override
  State<ToggleVisibilityPage> createState() => _ToggleVisibilityPageState();
}

class _ToggleVisibilityPageState extends State<ToggleVisibilityPage> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Toggle Visibility")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: _isVisible,
              child: const Text(
                "Hello, I'm visible!",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleVisibility,
              child: Text(_isVisible ? "Hide" : "Show"),
            ),
          ],
        ),
      ),
    );
  }
}
