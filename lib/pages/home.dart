import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // featured pizzas: image, name, price (same assets as the Menu page)
  static const List<Map<String, String>> featured = [
    {
      'image': 'assets/peperoni.jpg',
      'name': 'Peperoni Pizza',
      'price': 'RM 25.00',
    },
    {
      'image': 'assets/bbq.jpg',
      'name': 'BBQ Chicken Pizza',
      'price': 'RM 28.00',
    },
    {
      'image': 'assets/margherita.jpg',
      'name': 'Margherita Pizza',
      'price': 'RM 22.00',
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
          'WOW Pizza',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // logo
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/wow_pizza_logo.jpg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 220,
                color: Colors.lightBlue.shade100,
                child: const Icon(
                  Icons.local_pizza,
                  size: 80,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // welcome text
          const Text(
            'Welcome to WOW Pizza!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Freshly baked pizzas, made to order. Dine in or take away.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
          const SizedBox(height: 24),

          // featured pizzas
          const Text(
            'Customer Favourites',
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (final pizza in featured)
                  featuredCard(
                    pizza['image']!,
                    pizza['name']!,
                    pizza['price']!,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // navigation buttons
          navButton(context, Icons.restaurant_menu, 'Our Menu', '/menu'),
          navButton(context, Icons.info_outline, 'About Us', '/about'),
          navButton(context, Icons.contact_phone, 'Contact Us', '/contact'),
          navButton(context, Icons.facebook, 'Facebook', '/facebook'),
          navButton(context, Icons.alternate_email, 'Twitter', '/twitter'),
        ],
      ),
    );
  }

  // one featured pizza card
  Widget featuredCard(String image, String name, String price) {
    return SizedBox(
      width: 160,
      child: Card(
        elevation: 5,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 105,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 105,
                color: Colors.lightBlue.shade100,
                child: const Icon(Icons.local_pizza, size: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // full-width rounded button, same style as the "Back to Home" buttons
  Widget navButton(
    BuildContext context,
    IconData icon,
    String label,
    String route,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            side: const BorderSide(color: Colors.blue),
          ),
          onPressed: () => Navigator.pushNamed(context, route),
          icon: Icon(icon, color: Colors.blue),
          label: Text(
            label,
            style: const TextStyle(fontSize: 20.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
