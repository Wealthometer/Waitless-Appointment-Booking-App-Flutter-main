import 'package:flutter/material.dart';
import 'package:waitless1/CustomerDashbord/book_appointment_screen.dart';
import 'package:waitless1/CustomerDashbord/clinics_list.dart';
import 'package:waitless1/CustomerDashbord/garage_list.dart';
import 'package:waitless1/CustomerDashbord/retail_list.dart';
import 'package:waitless1/CustomerDashbord/rationStore_list.dart';
import 'package:waitless1/CustomerDashbord/salons_list.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final TextEditingController searchController = TextEditingController();
  String query = '';

  final List<Map<String, dynamic>> categories = const [
    {'title': 'Salon', 'icon': Icons.content_cut},
    {'title': 'Clinic', 'icon': Icons.local_hospital},
    {'title': 'Garage', 'icon': Icons.car_repair},
    {'title': 'Retail', 'icon': Icons.store},
    {'title': 'Ration Shop', 'icon': Icons.shopping_cart},
  ];

  final Map<String, List<Map<String, String>>> nearbyData = const {
    'Salon': [
      {'name': 'Elegant Salon', 'location': 'MG Road'},
      {'name': 'Glamour Hub', 'location': 'Indira Nagar'},
    ],
    'Clinic': [
      {'name': 'Sunshine Clinic', 'location': 'Ram Nagar'},
      {'name': 'Healing Touch', 'location': 'Main Street'},
    ],
    'Garage': [
      {'name': 'AutoFix Garage', 'location': 'Highway Road'},
      {'name': 'Speed Motors', 'location': 'Service Lane'},
    ],
    'Retail': [
      {'name': 'Smart Bazaar', 'location': 'Market Square'},
      {'name': 'City Mart', 'location': 'Station Road'},
    ],
    'Ration Shop': [
      {'name': 'Govt Ration Center 1', 'location': 'Block A'},
      {'name': 'Govt Ration Center 2', 'location': 'Block B'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    final List<Map<String, dynamic>> allSuggestions = [
      ...categories.map((c) => {'type': 'Category', 'title': c['title']}),
      for (var entry in nearbyData.entries)
        ...entry.value.map((shop) => {
          'type': entry.key,
          'title': shop['name'],
          'location': shop['location'],
        }),
    ];

    final List<Map<String, dynamic>> filteredSuggestions = allSuggestions
        .where((item) =>
        item['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("WaitLess", style: TextStyle(color: Colors.white)),
        backgroundColor: themeColor,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search bar
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search categories or shops...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              onChanged: (value) => setState(() => query = value),
            ),
            const SizedBox(height: 20),

            // 🔽 Live Suggestions
           // still no suggesions will occurs when user search in search tab

            // 🔶 Popular Categories
            Text("Popular Categories",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: themeColor)),
            const SizedBox(height: 16),

            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                       null;
                    },
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category['icon'],
                              size: 30, color: themeColor),
                          const SizedBox(height: 8),
                          Text(
                            category['title'],
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // 🔵 Nearby Services
            Text("Nearby Services",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeColor)),
            const SizedBox(height: 12),

            for (var category in categories)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category['title'],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: themeColor)),
                  const SizedBox(height: 8),
                  ...nearbyData[category['title']]!.map((place) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
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
                          const Icon(Icons.location_on,
                              color: Colors.blueAccent),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(place['name']!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(place['location']!,
                                    style:
                                    const TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BookAppointmentScreen(
                                    categoryName: category['title'],
                                    shopName: place['name'],
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text("Book",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
