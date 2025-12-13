import 'package:flutter/material.dart';
import 'book_appointment_screen.dart';

class RationShopScreen extends StatelessWidget {
  final List<Map<String, String>> rationShops = const [
    {'name': 'Govt Ration Center 1', 'location': 'Block A'},
    {'name': 'Govt Ration Center 2', 'location': 'Block B'},
    {'name': 'Public Distribution Point', 'location': 'Sector 12'},
    {'name': 'Food Supply Depot', 'location': 'Ring Road'},
  ];

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ration Shops"),
        backgroundColor: themeColor,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: rationShops.length,
        itemBuilder: (context, index) {
          final shop = rationShops[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ],
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart, size: 32, color: Colors.teal),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(shop['name']!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(shop['location']!,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookAppointmentScreen(
                          categoryName: 'Ration Shop',
                          shopName: shop['name'],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Book", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

