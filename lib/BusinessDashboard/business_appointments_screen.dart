import 'package:flutter/material.dart';
import '../CustomerDashbord/globals_dynamic.dart'; // Use the same appointment list

class BusinessAppointmentsScreen extends StatelessWidget {
  const BusinessAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    final List<Map<String, dynamic>> businessAppointments = confirmedAppointments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointments", style: TextStyle(color: Colors.white)),
        backgroundColor: themeColor,
      ),
      backgroundColor: Colors.grey[100],
      body: businessAppointments.isEmpty
          ? const Center(
        child: Text("No appointments booked yet."),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: businessAppointments.length,
        itemBuilder: (context, index) {
          final appointment = businessAppointments[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.person, color: Colors.blueAccent),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(appointment['name'],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Phone: ${appointment['phone']}"),
                      Text("Date: ${appointment['date']}"),
                      Text("Time: ${appointment['time']}"),
                      Text("Service: ${appointment['category']}"),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
