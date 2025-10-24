import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final dateController = TextEditingController();
  final codeController = TextEditingController();
  List<dynamic> rates = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchRates() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      String baseUrl = 'https://cbu.uz/ru/arkhiv-kursov-valyut/json/';
      String date = dateController.text.trim();
      String code = codeController.text.trim();

      String url;
      if (date.isEmpty && code.isEmpty) {
        url = baseUrl;
      } else if (code.isEmpty || code.toLowerCase() == 'all') {
        url = '$baseUrl/all/$date/';
      } else {
        url = '$baseUrl$code/$date/';
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          rates = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Rates (CBU.uz)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: dateController, decoration: const InputDecoration(labelText: 'Date (YYYY-MM-DD)')),
            TextField(controller: codeController, decoration: const InputDecoration(labelText: 'Currency Code (USD, RUB, all)')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: fetchRates, child: const Text('Fetch Rates')),
            const SizedBox(height: 20),
            if (isLoading) const CircularProgressIndicator(),
            if (error != null) Text('Error: $error'),
            if (!isLoading && error == null)
              Expanded(
                child: ListView.builder(
                  itemCount: rates.length,
                  itemBuilder: (context, index) {
                    var c = rates[index];
                    return ListTile(
                      title: Text('${c['CcyNm_RU']} (${c['Ccy']})'),
                      subtitle: Text('Rate: ${c['Rate']} UZS'),
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
