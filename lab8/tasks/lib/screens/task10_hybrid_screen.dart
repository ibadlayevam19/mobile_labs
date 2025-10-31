import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/database_helper.dart';

class Task10HybridScreen extends StatefulWidget {
  @override
  _Task10HybridScreenState createState() => _Task10HybridScreenState();
}

class _Task10HybridScreenState extends State<Task10HybridScreen> {
  double _fontSize = 16.0;
  List<Map<String, dynamic>> _tasks = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadSettings();
    _loadTasks();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('fontSize') ?? 16.0;
    });
  }

  Future<void> _saveFontSize(double size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', size);
    setState(() {
      _fontSize = size;
    });
  }

  Future<void> _loadTasks() async {
    final tasks = await _dbHelper.getNotes();
    setState(() {
      _tasks = tasks;
    });
  }

  Future<void> _addTask() async {
    final controller = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Add Task'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Task name',
            hintText: 'Enter task name',
          ),
          autofocus: true,
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              Navigator.pop(dialogContext, true);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                Navigator.pop(dialogContext, true);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter a task name')),
                );
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );

    if (result == true && controller.text.trim().isNotEmpty) {
      try {
        await _dbHelper.insertNote({
          'title': controller.text.trim(),
          'content': 'Created at ${DateTime.now()}',
        });
        await _loadTasks();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Task added successfully!')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error adding task: $e')),
          );
        }
      }
    }
    
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 10: Hybrid Storage')),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings (SharedPreferences)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text('Font Size: ${_fontSize.toInt()}'),
                  Slider(
                    value: _fontSize,
                    min: 12,
                    max: 24,
                    divisions: 12,
                    onChanged: _saveFontSize,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tasks (SQLite)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: _tasks.isEmpty
                ? Center(child: Text('No tasks', style: TextStyle(fontSize: _fontSize)))
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      return ListTile(
                        title: Text(
                          task['title'],
                          style: TextStyle(fontSize: _fontSize),
                        ),
                        subtitle: Text(
                          task['content'],
                          style: TextStyle(fontSize: _fontSize - 2),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await _dbHelper.deleteNote(task['id']);
                            _loadTasks();
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      
      ),);}
}
  