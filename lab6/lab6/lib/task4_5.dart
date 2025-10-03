import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Todo Model
class TodoListModel extends ChangeNotifier {
  final List<String> _tasks = [];
  List<String> get tasks => _tasks;

  void addTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}

// UI
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoListModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        labelText: "Enter task", border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      todoList.addTask(_controller.text);
                      _controller.clear();
                    }
                  },
                  child: const Text("Add"),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoList.tasks[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => todoList.removeTask(index),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
