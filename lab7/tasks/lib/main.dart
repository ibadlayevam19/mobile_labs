import 'package:flutter/material.dart';
import 'screens/posts_list_screen.dart';
import 'screens/create_post_screen.dart';
import 'screens/currency_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Tasks',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('API Practice Tasks')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('View Posts (Parts A-C)'),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (_)=> const PostsListScreen()),
                );
              }
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Create Post (Part D)'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_)=> const CreatePostScreen()),
                );
              }
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Currency Screen (Part E)'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_)=> const CurrencyScreen()),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

