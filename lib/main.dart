import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'home.dart';
import 'chpizza.dart';
import 'facebook.dart';
import 'twitter.dart';
import 'vpizza.dart';
import 'fries.dart';
import 'contact.dart';
=======
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/facebook.dart';
import 'pages/home.dart';
import 'pages/menu.dart';
import 'pages/twitter.dart';
>>>>>>> origin/main

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
        '/contact': (context) => Contact(),
        '/facebook': (context) => Facebook(),
        '/twitter': (context) => Twitter(),
      },
    );
  }
}
