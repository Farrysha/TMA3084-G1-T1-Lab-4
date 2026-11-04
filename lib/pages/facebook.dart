// Import flutter material package for UI components
import 'package:flutter/material.dart';

// Import WebView package to display web pages inside the app
import 'package:webview_flutter/webview_flutter.dart';

// Change class name to 'Facebook' to match what main.dart expects
class Facebook extends StatefulWidget {
  const Facebook({super.key});

  @override
  State<Facebook> createState() => _FacebookState();
}

// State class for Facebook page
class _FacebookState extends State<Facebook> {
  // WebViewController to control the WebView (load pages, execute JS, etc.)
  late final WebViewController controller;

  @override
  void initState() {
    super.initState(); // Call parent class initState

    // Initialize the WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // Enable JavaScript for web pages (default is disabled)
      ..loadRequest(Uri.parse('https://web.facebook.com/?_rdc=1&_rdr#'));
    // Load the URL inside the WebView
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provides basic UI layout: AppBar, Body
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
      // Display the WebView with the controller
    );
  }
}