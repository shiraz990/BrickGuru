import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ask_abc/utils/app_localizations.dart';

class DealerSupportScreen extends StatelessWidget {
  const DealerSupportScreen({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Future<void> _openWhatsApp(String phoneNumber) async {
    final Uri whatsappUri = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    }
  }

  Future<void> _sendEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=ABC Product Inquiry',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.dealerSupport),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 48,
                      color: Colors.red.shade600,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      localizations.findDealers,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Find nearby ABC dealers and distributors',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement dealer locator with maps
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Dealer locator coming soon!'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.map),
                      label: const Text('Open Map'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.support_agent,
                          size: 32,
                          color: Colors.orange.shade600,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          localizations.contactSupport,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _ContactOption(
                      icon: Icons.phone,
                      title: localizations.call,
                      subtitle: '+92-300-1234567',
                      color: Colors.green,
                      onTap: () => _makePhoneCall('+923001234567'),
                    ),
                    const SizedBox(height: 16),
                    _ContactOption(
                      icon: Icons.chat,
                      title: localizations.whatsapp,
                      subtitle: 'Chat with ABC experts',
                      color: Colors.green.shade700,
                      onTap: () => _openWhatsApp('923001234567'),
                    ),
                    const SizedBox(height: 16),
                    _ContactOption(
                      icon: Icons.email,
                      title: localizations.email,
                      subtitle: 'support@abcproducts.com',
                      color: Colors.blue,
                      onTap: () => _sendEmail('support@abcproducts.com'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sample Dealers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DealerCard(
                      name: 'ABC Construction Supplies',
                      address: 'Main Market, Lahore',
                      phone: '+92-42-1234567',
                      onCall: () => _makePhoneCall('+92421234567'),
                    ),
                    const SizedBox(height: 12),
                    _DealerCard(
                      name: 'ABC Building Materials',
                      address: 'Karachi Road, Islamabad',
                      phone: '+92-51-2345678',
                      onCall: () => _makePhoneCall('+92512345678'),
                    ),
                    const SizedBox(height: 12),
                    _DealerCard(
                      name: 'ABC Hardware Store',
                      address: 'Gulberg, Karachi',
                      phone: '+92-21-3456789',
                      onCall: () => _makePhoneCall('+92213456789'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ContactOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: color),
          ],
        ),
      ),
    );
  }
}

class _DealerCard extends StatelessWidget {
  final String name;
  final String address;
  final String phone;
  final VoidCallback onCall;

  const _DealerCard({
    required this.name,
    required this.address,
    required this.phone,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    address,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.phone, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  phone,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: onCall,
                  tooltip: 'Call',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

