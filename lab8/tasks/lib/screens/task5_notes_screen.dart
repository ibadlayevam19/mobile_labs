import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';

class Task5NotesScreen extends StatefulWidget {
  @override
  _Task5NotesScreenState createState() => _Task5NotesScreenState();
}

class _Task5NotesScreenState extends State<Task5NotesScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _notes = [];
  bool _isLoading = false;

  Future<void> _addDummyNote() async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      await _dbHelper.insertNote({
        'title': 'Note ${DateTime.now().millisecondsSinceEpoch}',
        'content': 'This is a dummy note created at ${DateTime.now()}',
      });
      await _viewNotes();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Dummy note added!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _viewNotes() async {
    try {
      final notes = await _dbHelper.getNotes();
      if (mounted) {
        setState(() {
          _notes = notes;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading notes: $e')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _viewNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 5: SQLite Notes')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _addDummyNote,
                    child: _isLoading 
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text('Add Note'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _viewNotes,
                    child: Text('View Notes'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _notes.isEmpty
                ? Center(child: Text('No notes yet'))
                : ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      final note = _notes[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          title: Text(note['title']),
                          subtitle: Text(note['content']),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}