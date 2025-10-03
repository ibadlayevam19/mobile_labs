import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1. State Model
class UserModel extends ChangeNotifier {
  String _username = "Guest";

  String get username => _username;

  void makeAdmin() {
    _username = "Admin";
    notifyListeners();
  }
}

// 2. UI
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Model Example")),
      body: Center(
        child: Consumer<UserModel>(
          builder: (context, user, child) => Text(
            "Username: ${user.username}",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<UserModel>(context, listen: false).makeAdmin(),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
