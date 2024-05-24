
import 'package:flutter/material.dart';

void main() => runApp(const WebScrape());
class WebScrape extends StatelessWidget {
  const WebScrape({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dart Web Scrape",
        home: Scaffold(
          appBar: AppBar(title: const Text("Dart Web Scrape")),
          body: const UrlCollector(),
        ),
    );
  }
}
class UrlCollector extends StatelessWidget {
  const UrlCollector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter the url you wish to scrape',
            ),
          ),
        ),
      ],    
    );
  }
}
