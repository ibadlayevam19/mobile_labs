import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/home_page.dart';
import 'pages/animation_page.dart';
import 'pages/gestures_page.dart';
import 'pages/list_page.dart';

void main() => runApp(const AdvancedUIApp());

class AdvancedUIApp extends StatefulWidget{
  const AdvancedUIApp({super.key});

  @override
  State<AdvancedUIApp> createState()=>_AdvancedUIAppState();
}

class _AdvancedUIAppState extends State<AdvancedUIApp>{
  bool isDark=false;
  int _selectedIndex=0;

  final List<Widget> _pages=const [
    HomePage(),
    AnimationPage(),
    GesturesPage(),
    ListPage(),
  ];

  void _onItemTapped(int index){
    setState(()=> _selectedIndex=index);
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced UI Designs',
      theme: isDark ? darkTheme: lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced UI Designs'),
          actions: [
            Switch(
              value: isDark,
              onChanged: (value)=>setState(()=> isDark=value),
            ),
          ],
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: isDark ? Colors.grey[850] : Colors.white,
          selectedItemColor: isDark ? Colors.lightBlueAccent : Colors.blue,
          unselectedItemColor: isDark ? Colors.grey[400] : Colors.grey[700],
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'Animate'),
            BottomNavigationBarItem(icon: Icon(Icons.touch_app), label: 'Gestures'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          ],
        ),
      ),
    );
  }
}
