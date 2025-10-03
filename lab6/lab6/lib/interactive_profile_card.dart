import 'package:flutter/material.dart';

class InteractiveProfileCard extends StatefulWidget {
  const InteractiveProfileCard({super.key});

  @override
  State<InteractiveProfileCard> createState() => _InteractiveProfileCardState();
}

class _InteractiveProfileCardState extends State<InteractiveProfileCard> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('Jane Smith'),
        subtitle: Text('jane.smith@email.com'),
      ),
    );
  }
}
