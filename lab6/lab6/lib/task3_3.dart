import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _celsius = 0.0;

  void _updateCelsius(String value) {
    setState(() {
      _celsius = double.tryParse(value) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Temperature Converter")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CelsiusInput(onChanged: _updateCelsius),
            const SizedBox(height: 20),
            FahrenheitDisplay(celsius: _celsius),
          ],
        ),
      ),
    );
  }
}

// Child widget: Celsius input
class CelsiusInput extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CelsiusInput({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: "Enter Celsius"),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}

// Child widget: Fahrenheit display
class FahrenheitDisplay extends StatelessWidget {
  final double celsius;

  const FahrenheitDisplay({super.key, required this.celsius});

  @override
  Widget build(BuildContext context) {
    final fahrenheit = (celsius * 9 / 5) + 32;
    return Text(
      "$celsius °C = ${fahrenheit.toStringAsFixed(2)} °F",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
