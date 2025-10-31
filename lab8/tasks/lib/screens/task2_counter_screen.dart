import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task2CounterScreen extends StatefulWidget {
  @override
  _Task2CounterScreenState createState() => _Task2CounterScreenState();
}

class _Task2CounterScreenState extends State<Task2CounterScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
    });
    await prefs.setInt('counter', _counter);
  }

  Future<void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
    });
    await prefs.setInt('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 2: Persistent Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value:', style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('Increment'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}