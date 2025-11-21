import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> callHttpFunction() async {
  // this is just not working url, we need paid one to include link
  final url = 'https://console.firebase.google.com/project/mp-lab12-520d7/usage/details';
  try {
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    print('HTTP Function response: $data');
  } catch (e) {
    print('Error calling HTTP Function: $e');
  }
}
