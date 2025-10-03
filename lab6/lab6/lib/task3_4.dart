import 'package:flutter/material.dart';

class SurveyApp extends StatefulWidget {
  const SurveyApp({super.key});

  @override
  State<SurveyApp> createState() => _SurveyAppState();
}

class _SurveyAppState extends State<SurveyApp> {
  double _satisfaction = 5.0;

  String get feedback {
    if (_satisfaction < 3) return "Awful";
    if (_satisfaction < 7) return "Okay";
    return "Great!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Survey App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: _satisfaction,
            min: 0,
            max: 10,
            divisions: 10,
            label: _satisfaction.toString(),
            onChanged: (value) {
              setState(() {
                _satisfaction = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Text("Satisfaction: ${feedback}",
              style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
