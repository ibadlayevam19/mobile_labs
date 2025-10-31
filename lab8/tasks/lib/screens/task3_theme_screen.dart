import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task3ThemeScreen extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final bool isDarkMode;

  Task3ThemeScreen({required this.onThemeChanged, required this.isDarkMode});

  @override
  _Task3ThemeScreenState createState() => _Task3ThemeScreenState();
}

class _Task3ThemeScreenState extends State<Task3ThemeScreen> {
  late bool _isDark;

  @override
  void initState() {
    super.initState();
    _isDark = widget.isDarkMode;
  }

  Future<void> _toggleTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', value);
    setState(() {
      _isDark = value;
    });
    widget.onThemeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 3: Theme Toggle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isDark ? Icons.dark_mode : Icons.light_mode,
              size: 100,
              color: _isDark ? Colors.yellow : Colors.orange,
            ),
            SizedBox(height: 32),
            Text(
              _isDark ? 'Dark Mode' : 'Light Mode',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            SwitchListTile(
              title: Text('Enable Dark Mode'),
              value: _isDark,
              onChanged: _toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}
