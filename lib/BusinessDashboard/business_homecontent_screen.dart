import 'package:flutter/material.dart';

class BusinessHomeContent extends StatefulWidget {
  const BusinessHomeContent({super.key});

  @override
  State<BusinessHomeContent> createState() => _BusinessHomeContentState();
}

class _BusinessHomeContentState extends State<BusinessHomeContent> {
  bool isShopOpen = true;
  int todaysAppointments = 5; // Replace with dynamic count later

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Dashboard", style: TextStyle(color: Colors.white)),
        backgroundColor: themeColor,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👋 Welcome message
            const Text(
              "Welcome, Business Owner!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // 📊 Today's Appointments
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.calendar_today, size: 32, color: Colors.blue),
                title: const Text("Today’s Appointments"),
                subtitle: Text("$todaysAppointments bookings"),
              ),
            ),
            const SizedBox(height: 20),

            // 🟢 Shop Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Shop Status", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Switch(
                  value: isShopOpen,
                  onChanged: (val) => setState(() => isShopOpen = val),
                  activeColor: Colors.green,
                ),
              ],
            ),
            Text(isShopOpen ? "🟢 Open" : "🔴 Closed", style: TextStyle(color: isShopOpen ? Colors.green : Colors.red)),

            const SizedBox(height: 30),

            // ⚡ Quick Actions (Placeholder - can add more features here)
            Text("Quick Actions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: themeColor)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(icon: Icons.list, label: "All Bookings", onTap: () {}),
                _buildActionButton(icon: Icons.person_add, label: "Add Staff", onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.blue[100],
            child: Icon(icon, color: Colors.blue[800], size: 30),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
