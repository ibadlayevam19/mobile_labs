import 'package:flutter/material.dart';

class UserNameForm extends StatefulWidget {
  const UserNameForm({super.key});

  @override
  State<UserNameForm> createState() => _UserNameFormState();
}

class _UserNameFormState extends State<UserNameForm> {
  String _userName = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter your name"),
            onChanged: (value) {
              setState(() {
                _userName = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            "Current value: $_userName",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
