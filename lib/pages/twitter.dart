// Import flutter material package for UI components
import 'package:flutter/material.dart';

// Import WebView package to display web pages inside the app
import 'package:webview_flutter/webview_flutter.dart';

// Change class name to 'Twitter' to match what main.dart expects
class Twitter extends StatefulWidget {
  const Twitter({super.key});

  @override
  State<Twitter> createState() => _TwitterState();
}

// State class for Twitter page
class _TwitterState extends State<Twitter> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://x.com/i/jf/onboarding/web?mode=signup'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Twitter Web View',
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
