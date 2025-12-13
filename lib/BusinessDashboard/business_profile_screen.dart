import 'package:flutter/material.dart';
import 'global_businessInfo.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Business Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: themeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.blue,
              child: Icon(Icons.store, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Business Info Display Only
            Text(
              "${businessInfo['shopName'] ?? 'Shop Name'}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Owner: ${businessInfo['ownerName'] ?? 'Owner Name'}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              "${businessInfo['email'] ?? 'example@email.com'}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(height: 40),

            // Non-functional options
            const ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Profile"),

            ),
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text("Change Password"),

            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),

            ),
          ],
        ),
      ),
    );
  }
}
