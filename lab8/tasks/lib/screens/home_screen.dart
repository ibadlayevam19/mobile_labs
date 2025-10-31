import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;
  final bool isDarkMode;

  HomeScreen({required this.onThemeChanged, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Persistence Tasks'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Lecture 9 Tasks',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  SizedBox(height: 8),
                  Text('Data Persistence Demo',
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Task 1: Username Save'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/username');
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text('Task 2: Counter'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/counter');
              },
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Task 3: Dark Mode'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/theme');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('Task 4-6: Notes (SQLite)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/notes');
              },
            ),
            ListTile(
              leading: Icon(Icons.edit_note),
              title: Text('Task 7-8: CRUD Notes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/crud-notes');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.file_present),
              title: Text('Task 9: File Storage'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/file-storage');
              },
            ),
            ListTile(
              leading: Icon(Icons.apps),
              title: Text('Task 10: Hybrid Storage'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/hybrid');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.storage, size: 80, color: Colors.blue),
              SizedBox(height: 24),
              Text(
                'Flutter Data Persistence',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Open the drawer to explore all 10 tasks',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}