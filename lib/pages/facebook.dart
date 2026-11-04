import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://web.facebook.com/?_rdc=1&_rdr#'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'FaceBook Web View',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}