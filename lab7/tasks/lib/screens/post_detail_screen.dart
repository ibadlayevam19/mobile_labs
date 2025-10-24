import 'package:flutter/material.dart';
class PostDetailScreen extends StatelessWidget{
  final String title;
  final String body;
  const PostDetailScreen({super.key, required this.title, required this.body});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(body, style: const TextStyle(fontSize: 18)),
          ]
        )
      ),
    );
  }
}