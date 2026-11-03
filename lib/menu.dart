import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  // pizza list: image, name, price
  static const List<Map<String, String>> pizzas = [
    {
      'image': 'assets/peperoni.jpg',
      'name': 'Peperoni Pizza',
      'price': 'RM 25.00',
    },
    {
      'image': 'assets/hawaiian.jpg',
      'name': 'Hawaiian Pizza',
      'price': 'RM 27.00',
    },
    {
      'image': 'assets/margherita.jpg',
      'name': 'Margherita Pizza',
      'price': 'RM 22.00',
    },
    {
      'image': 'assets/bbq.jpg',
      'name': 'BBQ Chicken Pizza',
      'price': 'RM 28.00',
    },
    {
      'image': 'assets/veggie.png',
      'name': 'Vegetarian Pizza',
      'price': 'RM 24.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Our Menu',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // pizza list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                for (final pizza in pizzas)
                  menuCard(pizza['image']!, pizza['name']!, pizza['price']!),
              ],
            ),
          ),

          // back to Home button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // menu card
  Widget menuCard(String image, String name, String price) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.local_pizza, size: 100, color: Colors.white),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
