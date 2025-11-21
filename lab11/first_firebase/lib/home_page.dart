import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cloud_functions.dart';
import 'notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  String? fcmToken;

  @override
  void initState() {
    super.initState();
    getFCMToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationService().showNotification(
        message.notification?.title ?? 'Firebase',
        message.notification?.body ?? '',
      );
    });
  }

  Future<void> getFCMToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    fcmToken = await messaging.getToken();
    print('FCM Token: $fcmToken');
    setState(() {});
  }

  Future<void> addMessage(String text) async {
    await messages.add({'text': text, 'createdAt': Timestamp.now()});
  }

  Future<void> updateMessage(String id, String newText) async {
    await messages.doc(id).update({'text': newText});
  }

  Future<void> deleteMessage(String id) async {
    await messages.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase All Tasks')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Enter message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      addMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            if (fcmToken != null) SelectableText('FCM Token: $fcmToken'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: callHttpFunction,
              child: Text('Call HTTP Cloud Function'),
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    messages.orderBy('createdAt', descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final doc = docs[index];
                      final text = doc['text'];
                      return ListTile(
                        title: Text(text),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    final editController =
                                        TextEditingController(text: text);
                                    return AlertDialog(
                                      title: Text('Edit Message'),
                                      content: TextField(
                                        controller: editController,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            updateMessage(
                                                doc.id, editController.text);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Save'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deleteMessage(doc.id),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
