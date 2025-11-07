import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget{
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState()=>_AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{
  bool toggled=false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState(){
    super.initState();
    _controller=
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation=Tween<double>(begin: 0, end: 200).animate(_controller);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()=>
              setState(()=>toggled=!toggled),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: toggled ? 200 : 100,
              height: toggled ? 200 : 100,
              decoration: BoxDecoration(
                color: toggled ? Colors.orange : Colors.green,
                borderRadius: BorderRadius.circular(toggled ? 50:8),
              ),
              child: Center(
                child: Text(
                  toggled ? "Toggled!" : "Tap Me!",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: (){
              _controller.forward(from: 0);
            },
            child: const Text("Run Logo Animation"),
          ),
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child){
              return Transform.translate(
                offset: Offset(_animation.value, 0),
                child: const FlutterLogo(size: 60),
              );
            }
          ),
        ],
      ),
    );

  }
}