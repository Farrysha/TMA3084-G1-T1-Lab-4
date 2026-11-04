import 'package:flutter/material.dart';

import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/home.dart';
import 'pages/menu.dart';
import 'pages/facebook.dart' as fb;
import 'pages/twitter.dart' as tw;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WOW Pizza',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/menu': (context) => const Menu(),
        '/about': (context) => const About(),
        '/contact': (context) => const Contact(),
        '/facebook': (context) => const fb.WebViewExample(),
        '/twitter': (context) => const tw.WebViewExample(),
      },
    );
  }
}
