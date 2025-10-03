import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// State Model
class CounterModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

// UI
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Extended Counter")),
      body: Center(
        child: Text("Count: ${counter.count}",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: counter.decrement,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "reset",
            onPressed: counter.reset,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: counter.increment,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
