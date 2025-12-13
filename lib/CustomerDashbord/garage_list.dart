import 'package:flutter/material.dart';
import 'book_appointment_screen.dart';

class GarageScreen extends StatelessWidget {
  final List<Map<String, String>> garages = const [
    {'name': 'AutoFix Garage', 'location': 'Highway Road'},
    {'name': 'Speed Motors', 'location': 'Service Lane'},
    {'name': 'Quick Repair Hub', 'location': 'Station Area'},
    {'name': 'MaxTorque AutoCare', 'location': 'City Center'},
  ];

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Garages"),
        backgroundColor: themeColor,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: garages.length,
        itemBuilder: (context, index) {
          final garage = garages[index];
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
                const Icon(Icons.car_repair, size: 32, color: Colors.blueGrey),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(garage['name']!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(garage['location']!,
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
                          categoryName: 'Garage',
                          shopName: garage['name'],
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
