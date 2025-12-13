import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'globals_dynamic.dart'; // Confirmed appointment list

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Appointments", style: TextStyle(color: Colors.white)),
        backgroundColor: themeColor,
      ),
      body: confirmedAppointments.isEmpty
          ? const Center(child: Text("No appointments confirmed yet."))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: confirmedAppointments.length,
        itemBuilder: (context, index) {
          final appointment = confirmedAppointments[index];
          return AppointmentCard(appointment: appointment, index: index);
        },
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Map<String, dynamic> appointment;
  final int index;

  const AppointmentCard({super.key, required this.appointment, required this.index});

  void _openMap(String address) async {
    final encoded = Uri.encodeComponent(address);
    final url = "https://www.google.com/maps/search/?api=1&query=$encoded";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Category
            Text(appointment['category'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: themeColor)),
            const SizedBox(height: 8),

            // 🔹 Shop Name
            if (appointment.containsKey('shopName'))
              Row(
                children: [
                  const Icon(Icons.store, size: 18),
                  const SizedBox(width: 8),
                  Text(appointment['shopName']),
                ],
              ),
            const SizedBox(height: 4),

            // 🔹 Owner Name
            if (appointment.containsKey('ownerName'))
              Row(
                children: [
                  const Icon(Icons.person, size: 18),
                  const SizedBox(width: 8),
                  Text("Owner: ${appointment['ownerName']}"),
                ],
              ),
            const SizedBox(height: 4),

            // 🔹 Customer Name
            Row(children: [
              const Icon(Icons.person_outline, size: 18),
              const SizedBox(width: 8),
              Text("You: ${appointment['name']}"),
            ]),
            const SizedBox(height: 4),

            // 🔹 Phone
            Row(children: [
              const Icon(Icons.phone, size: 18),
              const SizedBox(width: 8),
              Text(appointment['phone']),
            ]),
            const SizedBox(height: 4),

            // 🔹 Date and Time
            Row(children: [
              const Icon(Icons.calendar_today, size: 18),
              const SizedBox(width: 8),
              Text("${appointment['date']} at ${appointment['time']}"),
            ]),
            const SizedBox(height: 4),

            // 🔹 Queue Position
            Row(children: [
              const Icon(Icons.people, size: 18),
              const SizedBox(width: 8),
              Text("People before you: $index"),
            ]),
            const SizedBox(height: 4),

            // 🔹 Address
            if (appointment.containsKey('address'))
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(appointment['address'])),
                ],
              ),

            // 🔹 Google Maps Button
            if (appointment.containsKey('address'))
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () => _openMap(appointment['address']),
                  icon: const Icon(Icons.map),
                  label: const Text("Open in Google Maps"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
