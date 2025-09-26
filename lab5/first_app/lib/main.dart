import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'User profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _controller=TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: 
      //task1
  //     Center(
  //       child: Container(
  //       padding: const EdgeInsets.all(16.0),
  //       margin: const EdgeInsets.all(20.0),
  //       height: 150,
  //       width: 100,
  //       decoration: BoxDecoration(
  //       color: Colors.redAccent,
  //       borderRadius: BorderRadius.circular(20)
  //     ),
  //       child: const Icon(Icons.home),
  // ),
  //     ),
        //task2
//         Column(
//           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const <Widget>[
//             Icon(Icons.star, size:50),
//             Icon(Icons.star, size:50),
//             Icon(Icons.star, size:50),
//             Icon(Icons.star, size:50),
//             Icon(Icons.star, size:50)
//           ]
//         )
// , 
//
//Task3
// Center(
//   child: Column(
//     children:[
//   TextField(
//     controller: _controller,
//     obscureText: true,
//     decoration: InputDecoration(
//       icon: Icon(Icons.person),
//       border: OutlineInputBorder(),
//       labelText: 'Enter your password',
      
//     )
//   ),
//   const SizedBox(height:20),
//   ElevatedButton(
//     onPressed:(){
//       final input=_controller.text;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('You entered: $input')),
//       );
//     },
//     child: const Text('Submit'),

//   )
//   ]
// ),
// ),
//Task4
// Column(
//   children: <Widget>[
//     Expanded(
//       flex: 1,
//       child: Container(width: 100, height:100, color: Colors.red),
//       ),
//     Expanded(
//       flex:2,
//       child: Container(height: 100, color: Colors.green),
//     ),
//   ]
// ),
// Row(
//   children: <Widget>[
//     Container(width: 100, height: 100, color: Colors.blue),
//     Spacer(),
//     Container(width: 100, height: 100, color: Colors.black),
//   ]
// ),
//Task5
//chellenge1
// Center(
//   child:Container(
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: Colors.grey[400],
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         //row for avatar + username
//         Row(
//           children: [
//             const CircleAvatar(
//               child: Text('M'),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const[
//                   Text(
//                     'Malika Ibadlayeva',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     )
//                   ),
//                   Text(
//                     '@ibadlayevam',
//                     style:TextStyle(color: Colors.grey),
//                   ),
//                 ]
//               ),
//             ),
//           ]
//         ),
//         const SizedBox(height:16),
//         //Bio text
//         const Text(
//           'Go where you feel most alive...',
//           style: TextStyle(fontSize:14),
//         ),
//         const SizedBox(height: 16),
//         //row for follow + message buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children:[
//             ElevatedButton(
//               onPressed: (){},
//               child: const Text('Follow'),
//             ),
//             ElevatedButton(
//               onPressed:() {},
//               child: const Text('Message'),
//             ),

//           ],
//         ),
//       ]
//     )
//   )
// ),
//chellenge2

   Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.grey[700],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Image.network(
            'https://th.bing.com/th/id/OIP.MwLMpd46Vu0ae4XBPvYdwgHaFL?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3',
            fit: BoxFit.cover,
          ),
          
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const[
              Text(
                'Product Title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'A brief description of the item...',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$99.99',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                )
              )
            ]
          ),
        ),
      ]
    ),
  ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
