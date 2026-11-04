import 'package:flutter/material.dart';

// ----------------------------------------------------------------------------
//  Brand palette
// ----------------------------------------------------------------------------
const Color kTomato = Color(0xFFD62828); // primary red
const Color kCheese = Color(0xFFF9A826); // accent yellow
const Color kCrust = Color(0xFFFFF4E6); // warm background
const Color kCharcoal = Color(0xFF2B2118); // text
const Color kBasil = Color(0xFF2E7D32); // success / whatsapp

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  static const String routeName = '/contact';

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  // --------------------------------------------------------------------------
  //  Actions
  // --------------------------------------------------------------------------
  void _toast(String message, {Color background = kCharcoal}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: background,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
  }

  Future<void> _sendMessage() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    setState(() => _sending = true);
    await Future<void>.delayed(const Duration(milliseconds: 900)); // fake send
    if (!mounted) return;
    setState(() => _sending = false);

    final name = _nameCtrl.text.trim().split(' ').first;
    _toast('Thanks $name! We will reply to you shortly.', background: kBasil);
    _formKey.currentState!.reset();
    _nameCtrl.clear();
    _emailCtrl.clear();
    _messageCtrl.clear();
  }

  /// Returns to the Home page
  void _goBackToHome() {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
    } else {
      navigator.pushNamedAndRemoveUntil('/', (route) => false);
    }
  }

  // --------------------------------------------------------------------------
  //  Build
  // --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCrust,
      body: CustomScrollView(
        slivers: [
          // ---------------- Header image + title ----------------
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: kTomato,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(
                horizontal: 56,
                vertical: 14,
              ),
              title: const Text(
                'Contact Us',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  const _BrandImage(
                    asset: 'assets/images/storefront.jpg',
                    fallbackIcon: Icons.local_pizza,
                  ),
                  // dark scrim so the title stays readable
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.65),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ---------------- Intro: logo IMAGE + name ----------------
                  Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: kCheese,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: const _BrandImage(
                            asset: 'assets/images/logo.png',
                            fallbackIcon: Icons.local_pizza,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WOW Pizza',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: kCharcoal,
                              ),
                            ),
                            Text(
                              'Hot, cheesy and always on time.',
                              style: TextStyle(
                                fontSize: 13.5,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // ---------------- Contact details (IMAGE icons) ----------
                  const _SectionTitle('Reach Us'),
                  const SizedBox(height: 12),
                  _ContactTile(
                    leading: const _AssetIcon(
                      asset: 'assets/images/pin.png',
                      fallbackIcon: Icons.location_on,
                      color: kTomato,
                    ),
                    color: kTomato,
                    label: 'Outlet',
                    value: 'Lot 21, Jalan Tun Jugah,\n93350 Kuching, Sarawak',
                    onTap: () => _toast('Opening directions to WOW Pizza...'),
                  ),
                  _ContactTile(
                    leading: const _AssetIcon(
                      asset: 'assets/images/phone.png',
                      fallbackIcon: Icons.phone,
                      color: kBasil,
                    ),
                    color: kBasil,
                    label: 'Call / WhatsApp',
                    value: '+60 82-555 123',
                    onTap: () => _toast('Calling +60 82-555 123...'),
                  ),
                  _ContactTile(
                    leading: const _AssetIcon(
                      asset: 'assets/images/mail.png',
                      fallbackIcon: Icons.email,
                      color: kCheese,
                    ),
                    color: kCheese,
                    label: 'Email',
                    value: 'hello@wowpizza.com.my',
                    onTap: () =>
                        _toast('Opening email to hello@wowpizza.com.my'),
                  ),
                  _ContactTile(
                    leading: const _AssetIcon(
                      asset: 'assets/images/clock.png',
                      fallbackIcon: Icons.access_time_filled,
                      color: Colors.blueGrey,
                    ),
                    color: Colors.blueGrey,
                    label: 'Opening Hours',
                    value: 'Mon – Sun  •  11:00 am – 11:00 pm',
                    onTap: () => _toast('We are open right now!'),
                  ),

                  const SizedBox(height: 28),

                  // ---------------- Map image ----------------
                  const _SectionTitle('Find Us'),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: SizedBox(
                      height: 160,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          const _BrandImage(
                            asset: 'assets/images/map.png',
                            fallbackIcon: Icons.map,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: FilledButton.icon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: kTomato,
                                ),
                                onPressed: () =>
                                    _toast('Launching Google Maps...'),
                                icon: const Icon(Icons.directions, size: 18),
                                label: const Text('Directions'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ---------------- Message form ----------------
                  const _SectionTitle('Send Us a Message'),
                  const SizedBox(height: 12),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _Field(
                          controller: _nameCtrl,
                          label: 'Your name',
                          icon: Icons.person_outline,
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? 'Please enter your name'
                              : null,
                        ),
                        const SizedBox(height: 14),
                        _Field(
                          controller: _emailCtrl,
                          label: 'Email address',
                          icon: Icons.alternate_email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!v.contains('@') || !v.contains('.')) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        _Field(
                          controller: _messageCtrl,
                          label: 'Your message',
                          icon: Icons.chat_bubble_outline,
                          maxLines: 4,
                          validator: (v) => (v == null || v.trim().length < 5)
                              ? 'Tell us a little more'
                              : null,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 52,
                          child: FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: kTomato,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: _sending ? null : _sendMessage,
                            icon: _sending
                                ? const SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Icon(Icons.send),
                            label: Text(
                              _sending ? 'Sending...' : 'Send Message',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ---------------- Social buttons (IMAGE logos) ----------
                  const _SectionTitle('Follow WOW Pizza'),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _SocialButton(
                        asset: 'assets/images/facebook.png',
                        fallbackIcon: Icons.facebook,
                        color: const Color(0xFF1877F2),
                        onTap: () => _toast('Opening Facebook page...'),
                      ),
                      _SocialButton(
                        asset: 'assets/images/instagram.png',
                        fallbackIcon: Icons.camera_alt,
                        color: const Color(0xFFC13584),
                        onTap: () => _toast('Opening Instagram...'),
                      ),
                      _SocialButton(
                        asset: 'assets/images/whatsapp.png',
                        fallbackIcon: Icons.chat,
                        color: kBasil,
                        onTap: () => _toast('Opening WhatsApp chat...'),
                      ),
                      _SocialButton(
                        asset: 'assets/images/web.png',
                        fallbackIcon: Icons.public,
                        color: kCharcoal,
                        onTap: () => _toast('Opening wowpizza.com.my'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // ---------------- Navigation button ----------------
                  SizedBox(
                    height: 50,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: kTomato,
                        side: const BorderSide(color: kTomato, width: 1.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: _goBackToHome,
                      icon: const Icon(Icons.home),
                      label: const Text('Back to Home'),
                    ),
                  ),

                  const SizedBox(height: 18),
                  const Center(
                    child: Text(
                      '© 2026 WOW Pizza Sdn. Bhd.',
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------------------------------
//  Reusable widgets
// ----------------------------------------------------------------------------

class _BrandImage extends StatelessWidget {
  const _BrandImage({
    required this.asset,
    required this.fallbackIcon,
    this.fit = BoxFit.cover,
  });

  final String asset;
  final IconData fallbackIcon;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      fit: fit,
      errorBuilder: (context, error, stack) => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kTomato, kCheese],
          ),
        ),
        child: Center(
          child: Icon(
            fallbackIcon,
            size: 40,
            color: Colors.white.withValues(alpha: 0.85),
          ),
        ),
      ),
    );
  }
}

/// Small square image used in place of an icon.
/// Falls back to a Material icon when the PNG is missing.
class _AssetIcon extends StatelessWidget {
  const _AssetIcon({
    required this.asset,
    required this.fallbackIcon,
    required this.color,
    this.size = 24,
  });

  final String asset;
  final IconData fallbackIcon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stack) =>
          Icon(fallbackIcon, color: color, size: size),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 4, height: 18, color: kCheese),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: kCharcoal,
          ),
        ),
      ],
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.leading,
    required this.color,
    required this.label,
    required this.value,
    required this.onTap,
  });

  /// Any widget — an _AssetIcon, an Image.asset, or a plain Icon.
  final Widget leading;
  final Color color;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                height: 44,
                width: 44,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: FittedBox(child: leading),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 14.5,
                        color: kCharcoal,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.black26),
            ],
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.label,
    required this.icon,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(color: kCharcoal),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: kTomato),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: kTomato, width: 1.6),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.asset,
    required this.fallbackIcon,
    required this.color,
    required this.onTap,
  });

  final String asset;
  final IconData fallbackIcon;
  final Color color;
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
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.35)),
          ),
          child: _AssetIcon(
            asset: asset,
            fallbackIcon: fallbackIcon,
            color: color,
            size: 26,
          ),
        ),
      ),
    );
  }
}
