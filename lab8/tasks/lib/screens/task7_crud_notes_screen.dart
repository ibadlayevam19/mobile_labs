import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';
import 'note_detail_screen.dart';

class Task7CRUDNotesScreen extends StatefulWidget {
  @override
  _Task7CRUDNotesScreenState createState() => _Task7CRUDNotesScreenState();
}

class _Task7CRUDNotesScreenState extends State<Task7CRUDNotesScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await _dbHelper.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  void _addOrEditNote({Map<String, dynamic>? note}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailScreen(note: note),
      ),
    );
    if (result == true) {
      _loadNotes();
    }
  }

  Future<void> _deleteNote(int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Note'),
        content: Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _dbHelper.deleteNote(id);
      _loadNotes();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note deleted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 7: CRUD Notes')),
      body: _notes.isEmpty
          ? Center(child: Text('No notes. Tap + to add one!'))
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(note['title']),
                    subtitle: Text(
                      note['content'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteNote(note['id']),
                    ),
                    onTap: () => _addOrEditNote(note: note),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditNote(),
        child: Icon(Icons.add),
      ),
    );
  }
}
