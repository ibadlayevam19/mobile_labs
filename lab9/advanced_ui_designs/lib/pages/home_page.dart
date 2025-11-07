import 'package:flutter/material.dart';
import '../widgets/custom_title.dart';
import '../widgets/custom_counter.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomTitle(text: 'Welcome Home!', color: Colors.blue),
          const SizedBox(height: 20),
          const CustomCounter(),
          const SizedBox(height: 20),

          //task1
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(4, (i){
              return Container(
                width: 70,
                height: 70,
                color: Colors.primaries[i]
              );
            })
          ),
        ],
      ),
    );
  }
}