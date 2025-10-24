import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  Future<void> submitPost() async {
    final url = Uri.parse('https://reqres.in/api/posts');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, // ✅ important
        body: jsonEncode({
          'title': titleController.text,
          'body': bodyController.text,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('✅ Response: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post submitted successfully.')),
        );
      } else {
        print('❌ Failed: ${response.statusCode} - ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Submission failed: ${response.statusCode}')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitPost,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
