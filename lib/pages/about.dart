import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'About Us',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
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
                const Text(
                  'WOW Pizza',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'WOW Pizza is a small pizza shop. We bake each pizza to order, from classic margherita to BBQ chicken.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                const SizedBox(height: 16),
                infoCard(
                  Icons.restaurant_menu,
                  'What we serve',
                  'Pepperoni, Hawaiian, margherita, BBQ chicken, and vegetarian pizzas. See Our Menu for prices.',
                ),
                infoCard(
                  Icons.schedule,
                  'Opening hours',
                  'Monday to Sunday, 11:00 AM to 10:00 PM.',
                ),
                infoCard(
                  Icons.place,
                  'Find us',
                  'Kuching, Sarawak. Dine in or take away.',
                ),
              ],
            ),
          ),
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

  Widget infoCard(IconData icon, String title, String body) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 36, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    body,
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
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
