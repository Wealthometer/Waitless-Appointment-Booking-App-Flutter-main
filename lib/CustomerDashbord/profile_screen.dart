import 'package:flutter/material.dart';
import 'package:waitless1/CustomerDashbord/global_user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, String> get currentUser {
    return users.firstWhere(
          (user) => user['email'] == loggedInEmail,
      orElse: () => {'name': 'Unknown', 'email': 'unknown@example.com'},
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: themeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Display user info
            Text(
              currentUser['name'] ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              currentUser['email'] ?? "",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const Divider(height: 40),

            // Visible but non-functional options
            const ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Profile"),
              // onTap removed
            ),
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text("Change Password"),
              // onTap removed
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              // onTap removed
            ),
          ],
        ),
      ),
    );
  }
}
