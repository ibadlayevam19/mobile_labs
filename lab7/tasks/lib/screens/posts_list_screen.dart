import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'post_detail_screen.dart';

class PostsListScreen extends StatefulWidget{
  const PostsListScreen({super.key});

  @override
  State<PostsListScreen> createState()=> _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen>{
  late Future<List<dynamic>> _postsFuture;
  Future<List<dynamic>> fetchPosts() async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode==200){
      var data=jsonDecode(response.body);
      print('First post title: ${data[0]['title']}');
      return data;
    }else{
      throw Exception('Failed to load posts');
    }
  }
  @override
  void initState(){
    super.initState();
    _postsFuture=fetchPosts();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Posts List')),
      body: FutureBuilder<List<dynamic>>(
        future: _postsFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  ElevatedButton(
                    onPressed: (){
                      setState((){
                        _postsFuture=fetchPosts();
                      });
                    },
                    child: const Text('Retry'),
                  )
                ]
              ),);
          }else{
            var posts=snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index){
                var post=posts[index];
                return ListTile(
                  title: Text(post['title']),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_)=>PostDetailScreen(
                          title: post['title'],
                          body: post['body'],
                        )
                      ),);
                  }
                );
              }
            );
          }
        }
      )
    );
  }
}