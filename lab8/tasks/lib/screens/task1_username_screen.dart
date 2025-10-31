import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task1UsernameScreen extends StatefulWidget {
  @override
  _Task1UsernameScreenState createState() => _Task1UsernameScreenState();
}

class _Task1UsernameScreenState extends State<Task1UsernameScreen> {
  final TextEditingController _controller = TextEditingController();
  String _savedUsername = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedUsername = prefs.getString('username') ?? 'No username saved';
    });
  }

  Future<void> _saveUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _controller.text);
    _loadUsername();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Username saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 1: Save Username')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveUsername,
              child: Text('Save'),
            ),
            SizedBox(height: 32),
            Text(
              'Saved Username:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              _savedUsername,
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}