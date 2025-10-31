import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/task1_username_screen.dart';
import 'screens/task2_counter_screen.dart';
import 'screens/task3_theme_screen.dart';
import 'screens/task5_notes_screen.dart';
import 'screens/task7_crud_notes_screen.dart';
import 'screens/task9_file_storage_screen.dart';
import 'screens/task10_hybrid_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Persistence Demo',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(onThemeChanged: _toggleTheme, isDarkMode: _isDarkMode),
      routes: {
        '/username': (context) => Task1UsernameScreen(),
        '/counter': (context) => Task2CounterScreen(),
        '/theme': (context) => Task3ThemeScreen(
              onThemeChanged: _toggleTheme,
              isDarkMode: _isDarkMode,
            ),
        '/notes': (context) => Task5NotesScreen(),
        '/crud-notes': (context) => Task7CRUDNotesScreen(),
        '/file-storage': (context) => Task9FileStorageScreen(),
        '/hybrid': (context) => Task10HybridScreen(),
      },
    );
  }
}