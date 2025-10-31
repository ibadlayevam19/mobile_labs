import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Task9FileStorageScreen extends StatefulWidget {
  @override
  _Task9FileStorageScreenState createState() => _Task9FileStorageScreenState();
}

class _Task9FileStorageScreenState extends State<Task9FileStorageScreen> {
  final TextEditingController _controller = TextEditingController();
  String _fileContent = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/user_data.txt');
  }

  Future<void> _writeFile() async {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter some text')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final file = await _localFile;
      await file.writeAsString(_controller.text);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File saved successfully!')),
        );
        await _readFile();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving file: $e')),
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

  Future<void> _readFile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final file = await _localFile;
      if (await file.exists()) {
        final contents = await file.readAsString();
        if (mounted) {
          setState(() {
            _fileContent = contents;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _fileContent = 'No file found. Write something first!';
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _fileContent = 'Error reading file: $e';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _readFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 9: File Storage')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
                hintText: 'Type something to save...',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isLoading ? null : _writeFile,
                    icon: Icon(Icons.save),
                    label: Text('Write to File'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isLoading ? null : _readFile,
                    icon: Icon(Icons.refresh),
                    label: Text('Read from File'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'File Content:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[100],
                ),
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Text(
                          _fileContent.isEmpty ? 'No content yet' : _fileContent,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}