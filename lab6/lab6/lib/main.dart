import 'package:flutter/material.dart';
import 'static_profile_card.dart';
import 'interactive_profile_card.dart';
import 'product_card.dart';
import 'like_button.dart';
import 'user_name_form.dart';
import 'counter_page.dart';
import 'toggle_visibility_page.dart';
import 'item_list_page.dart';
import 'color_box_page.dart';
import 'task3_1.dart';
import 'task3_2.dart';
import 'task3_3.dart';
import 'task3_4.dart';
import 'task3_5.dart'; 
import 'package:provider/provider.dart';

 import 'task4_2.dart'; 
 import 'task4_3.dart'; 
 import 'task4_4.dart'; 
import 'task4_5.dart'; 

void main() {
  runApp(const MaterialApp(home: DemoPage()));
  //for task4
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       // Change this provider depending on the task
  //       // ChangeNotifierProvider(create: (_) => UserModel()),
  //       // ChangeNotifierProvider(create: (_) => CounterModel()),
  //       // ChangeNotifierProvider(create: (_) => ThemeModel()),
  //       ChangeNotifierProvider(create: (_) => TodoListModel()),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeProvider>().isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const CounterPage(), //  your starting page
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    //task1
    // return Scaffold(
    //   appBar: AppBar(title: const Text("Flutter State Demo")),
    //   body: ListView(
    //     padding: const EdgeInsets.all(16),
    //     children: const [
    //       StaticProfileCard(),
    //       InteractiveProfileCard(),
    //       ProductCard(productName: "Laptop", price: 1200.50),
    //       LikeButton(),
    //       UserNameForm(),
    //     ],
    //   ),
    // );
    //task2
    // return Scaffold(
    //   appBar: AppBar(title: const Text("State Management Demos")),
    //   body: ListView(
    //     padding: const EdgeInsets.all(16),
    //     children: [
    //       ElevatedButton(
    //         onPressed: () => Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (_) => const CounterPage()),
    //         ),
    //         child: const Text("Counter Page (Task 2)"),
    //       ),
    //       ElevatedButton(
    //         onPressed: () => Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (_) => const ToggleVisibilityPage()),
    //         ),
    //         child: const Text("Toggle Visibility (Task 3)"),
    //       ),
    //       ElevatedButton(
    //         onPressed: () => Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (_) => const ItemListPage()),
    //         ),
    //         child: const Text("Dynamic List (Task 4)"),
    //       ),
    //       ElevatedButton(
    //         onPressed: () => Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (_) => const ColorBoxPage()),
    //         ),
    //         child: const Text("Color Box (Task 5)"),
    //       ),
    //     ],
    //   ),
    // );
    //task3
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: SurveyApp(), // change to selected task
    // );
    //task4
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(), // Change based on task
    );
  }
}
