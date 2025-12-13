import 'package:flutter/material.dart';
import 'book_appointment_screen.dart';

class ClinicScreen extends StatelessWidget {
  final List<Map<String, String>> clinics = const [
    {'name': 'Sunshine Clinic', 'location': 'Ram Nagar'},
    {'name': 'Healing Touch', 'location': 'Main Street'},
    {'name': 'Care Plus Clinic', 'location': 'Baker Street'},
    {'name': 'LifeLine Health', 'location': 'Sector 4'},
  ];

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Clinics"),
        backgroundColor: themeColor,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: clinics.length,
        itemBuilder: (context, index) {
          final clinic = clinics[index];
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
                const Icon(Icons.local_hospital, size: 32, color: Colors.green),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(clinic['name']!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(clinic['location']!,
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
                          categoryName: 'Clinic',
                          shopName: clinic['name'],
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
