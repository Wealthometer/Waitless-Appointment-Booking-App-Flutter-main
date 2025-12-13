import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/appointment.png",
      "title": "Welcome to WaitLess",
      "subtitle": "Your time-saving appointment partner!"
    },
    {
      "image": "assets/booking.PNG",
      "title": "Easy Booking",
      "subtitle": "Book services with just a tap, anytime."
    },
    {
      "image": "assets/reminder.png",
      "title": "Smart Reminders",
      "subtitle": "Get alerts and updates directly to your phone."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        onboardingData[index]['image']!,
                        height: 250,
                      ),
                      SizedBox(height: 40),
                      Text(
                        onboardingData[index]['title']!,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        onboardingData[index]['subtitle']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          /// Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
                  (index) => buildDot(index: index),
            ),
          ),

          SizedBox(height: 30),

          /// Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Center(
                child: Text(
                  currentIndex == 2 ? "Get Started" : "Next",
                  style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  /// Dot Widget
  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: currentIndex == index ? 24 : 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.blue[900] : Colors.grey,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
