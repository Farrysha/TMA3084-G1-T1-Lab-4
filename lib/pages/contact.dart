// =============================================================================
//  WOW PIZZA — Contact Page (simple version, with animation)
//  File: lib/pages/contact.dart
//
//  This page is part of the WOW Pizza app and is reached from main.dart:
//      routes: { '/contact': (context) => const ContactPage() }
//
//  Navigation OUT of this page uses these named routes from main.dart:
//      '/'          Home
//      '/menu'      Menu
//      '/facebook'  Facebook WebView page
//      '/twitter'   Twitter WebView page
//
//  ---------------------------------------------------------------------------
//  pubspec.yaml must contain (mind the spacing):
//
//      flutter:
//        uses-material-design: true
//        assets:
//          - assets/images/
//
//  Then: flutter pub get -> STOP the app -> run again.
//  (Hot reload does not load newly added images.)
//  ---------------------------------------------------------------------------
//
//  ANIMATIONS ON THIS PAGE
//    1. Each section fades in and slides up, one after another  (_FadeSlideIn)
//    2. The pizza logo gently pulses forever                    (_PulsingLogo)
// =============================================================================

import 'package:flutter/material.dart';

// ----------------------------------------------------------------------------
//  Colours
// ----------------------------------------------------------------------------
const Color kTomato = Color(0xFFD62828);
const Color kCheese = Color(0xFFF9A826);
const Color kCrust = Color(0xFFFFF4E6);
const Color kCharcoal = Color(0xFF2B2118);
const Color kBasil = Color(0xFF2E7D32);

// ----------------------------------------------------------------------------
//  Image paths
// ----------------------------------------------------------------------------
const String imgStorefront = 'assets/images/storefront.jpg';
const String imgMap = 'assets/images/map.png';
const String imgPin = 'assets/images/pin.png';
const String imgPhone = 'assets/images/phone.png';
const String imgMail = 'assets/images/mail.png';
const String imgClock = 'assets/images/clock.png';
const String imgFacebook = 'assets/images/facebook.png';
const String imgInstagram = 'assets/images/instagram.png';
const String imgWhatsapp = 'assets/images/whatsapp.png';
const String imgWeb = 'assets/images/web.png';

// =============================================================================
//  THE PAGE
// =============================================================================
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const String routeName = '/contact';

  void _toast(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: kCharcoal,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCrust,
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: kTomato,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ---------- 1. Header photo ----------
          _FadeSlideIn(
            delayMs: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: _Picture(path: imgStorefront, height: 160),
            ),
          ),
          const SizedBox(height: 20),

          // ---------- 2. Logo + name (logo pulses) ----------
          _FadeSlideIn(
            delayMs: 120,
            child: Row(
              children: [
                const _PulsingLogo(),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'WOW Pizza',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kCharcoal,
                      ),
                    ),
                    Text(
                      'Hot, cheesy and always on time.',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ---------- 3. Contact rows ----------
          _FadeSlideIn(
            delayMs: 240,
            child: _InfoCard(
              image: imgPin,
              title: 'Outlet',
              detail: 'Lot 21, Jalan Tun Jugah, Kuching',
              onTap: () => _toast(context, 'Opening directions...'),
            ),
          ),
          _FadeSlideIn(
            delayMs: 320,
            child: _InfoCard(
              image: imgPhone,
              title: 'Phone',
              detail: '+60 82-555 123',
              onTap: () => _toast(context, 'Calling WOW Pizza...'),
            ),
          ),
          _FadeSlideIn(
            delayMs: 400,
            child: _InfoCard(
              image: imgMail,
              title: 'Email',
              detail: 'hello@wowpizza.com.my',
              onTap: () => _toast(context, 'Opening email...'),
            ),
          ),
          _FadeSlideIn(
            delayMs: 480,
            child: _InfoCard(
              image: imgClock,
              title: 'Opening Hours',
              detail: 'Mon – Sun, 11:00 am – 11:00 pm',
              onTap: () => _toast(context, 'We are open now!'),
            ),
          ),
          const SizedBox(height: 24),

          // ---------- 4. Map ----------
          _FadeSlideIn(
            delayMs: 560,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: _Picture(path: imgMap, height: 140),
            ),
          ),
          const SizedBox(height: 24),

          // ---------- 5. Social buttons ----------
          _FadeSlideIn(
            delayMs: 640,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ---- goes to pages/facebook.dart ----
                _SocialButton(
                  image: imgFacebook,
                  onTap: () => Navigator.pushNamed(context, '/facebook'),
                ),
                // ---- goes to pages/twitter.dart ----
                // (using web.png because there is no twitter.png yet)
                _SocialButton(
                  image: imgWeb,
                  onTap: () => Navigator.pushNamed(context, '/twitter'),
                ),
                // ---- no page for these two yet, so they just show a message ----
                _SocialButton(
                  image: imgInstagram,
                  onTap: () => _toast(context, 'Instagram page coming soon.'),
                ),
                _SocialButton(
                  image: imgWhatsapp,
                  onTap: () => _toast(context, 'WhatsApp chat coming soon.'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // ---------- 6. Buttons ----------
          _FadeSlideIn(
            delayMs: 720,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kTomato,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () => _toast(context, 'Calling WOW Pizza...'),
                    icon: const Icon(Icons.phone),
                    label: const Text('Call Us Now'),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: kTomato,
                      side: const BorderSide(color: kTomato, width: 1.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    // ---- goes to pages/menu.dart ----
                    onPressed: () => Navigator.pushNamed(context, '/menu'),
                    icon: const Icon(Icons.restaurant_menu),
                    label: const Text('See Our Menu'),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(foregroundColor: kCharcoal),
                    // ---- back to pages/home.dart, clearing the stack ----
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    ),
                    icon: const Icon(Icons.home),
                    label: const Text('Back to Home'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Center(
            child: Text(
              '© 2026 WOW Pizza',
              style: TextStyle(fontSize: 12, color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
//  ANIMATION 1 — fade in and slide up, after a delay
// =============================================================================
class _FadeSlideIn extends StatefulWidget {
  const _FadeSlideIn({required this.child, this.delayMs = 0});

  final Widget child;
  final int delayMs;

  @override
  State<_FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<_FadeSlideIn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 450),
  );

  @override
  void initState() {
    super.initState();
    // wait for the delay, then play the animation
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curve = CurvedAnimation(parent: _c, curve: Curves.easeOut);
    return FadeTransition(
      opacity: curve,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.18), // start slightly lower
          end: Offset.zero,
        ).animate(curve),
        child: widget.child,
      ),
    );
  }
}

// =============================================================================
//  ANIMATION 2 — logo that gently pulses forever
// =============================================================================
class _PulsingLogo extends StatefulWidget {
  const _PulsingLogo();

  @override
  State<_PulsingLogo> createState() => _PulsingLogoState();
}

class _PulsingLogoState extends State<_PulsingLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat(reverse: true); // grow, shrink, grow, shrink...

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.92,
        end: 1.08,
      ).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut)),
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          color: kCheese,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.local_pizza, color: Colors.white, size: 30),
      ),
    );
  }
}

// =============================================================================
//  SMALL BUILDING BLOCKS
// =============================================================================

/// A picture from assets. Shows a red "missing" box if the file is not found.
class _Picture extends StatelessWidget {
  const _Picture({required this.path, required this.height});

  final String path;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stack) => Container(
        height: height,
        color: const Color(0xFFB00020),
        alignment: Alignment.center,
        child: Text(
          'MISSING: $path',
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
      ),
    );
  }
}

/// One tappable contact row with a PNG icon.
class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.image,
    required this.title,
    required this.detail,
    required this.onTap,
  });

  final String image;
  final String title;
  final String detail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        leading: Image.asset(
          image,
          width: 30,
          height: 30,
          errorBuilder: (c, e, s) => const Icon(
            Icons.image_not_supported,
            color: Colors.red,
            size: 30,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          detail,
          style: const TextStyle(fontSize: 14.5, color: kCharcoal),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.black26),
      ),
    );
  }
}

/// One round social button with a PNG logo.
class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.image, required this.onTap});

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Container(
          height: 52,
          width: 52,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.contain,
            errorBuilder: (c, e, s) =>
                const Icon(Icons.broken_image, color: Colors.red, size: 20),
          ),
        ),
      ),
    );
  }
}
