import 'package:flutter/material.dart';

// Parent Widget
class SwitchManager extends StatefulWidget {
  const SwitchManager({super.key});

  @override
  State<SwitchManager> createState() => _SwitchManagerState();
}

class _SwitchManagerState extends State<SwitchManager> {
  bool _isActive = false;

  void _handleSwitchChanged(bool newValue) {
    setState(() {
      _isActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(   // 👈 wrap with Scaffold
      appBar: AppBar(title: const Text("Lifting State Up - Switch")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The Switch is: ${_isActive ? "ON" : "OFF"}"),
            InteractiveSwitch(
              isActive: _isActive,
              onChanged: _handleSwitchChanged,
            ),
          ],
        ),
      ),
    );
  }
}

// Child Widget
class InteractiveSwitch extends StatelessWidget {
  final bool isActive;
  final ValueChanged<bool> onChanged;

  const InteractiveSwitch({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isActive,
      onChanged: onChanged,
    );
  }
}
