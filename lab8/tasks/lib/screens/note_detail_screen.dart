import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';

class NoteDetailScreen extends StatefulWidget {
  final Map<String, dynamic>? note;

  NoteDetailScreen({this.note});

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!['title'];
      _contentController.text = widget.note!['content'];
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a title')),
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      if (widget.note == null) {
        await _dbHelper.insertNote({
          'title': _titleController.text.trim(),
          'content': _contentController.text.trim(),
        });
      } else {
        await _dbHelper.updateNote({
          'id': widget.note!['id'],
          'title': _titleController.text.trim(),
          'content': _contentController.text.trim(),
        });
      }

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving note: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Add Note' : 'Edit Note'),
        actions: [
          IconButton(
            icon: _isSaving 
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Icon(Icons.save),
            onPressed: _isSaving ? null : _saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isSaving ? null : _saveNote,
                icon: Icon(Icons.save),
                label: Text(_isSaving ? 'Saving...' : 'Save Note'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}