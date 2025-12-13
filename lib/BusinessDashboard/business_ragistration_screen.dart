import 'package:flutter/material.dart';

import 'business_home_screen.dart';
import 'global_businessInfo.dart';
 // Replace with your actual dashboard screen

class BusinessRegistrationScreen extends StatefulWidget {
  const BusinessRegistrationScreen({super.key});

  @override
  State<BusinessRegistrationScreen> createState() => _BusinessRegistrationScreenState();
}

class _BusinessRegistrationScreenState extends State<BusinessRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController openTimeController = TextEditingController();
  final TextEditingController closeTimeController = TextEditingController();

  bool isSubmitting = false;

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isSubmitting = true);

    // Save data globally
    businessInfo = {
      'shopName': shopNameController.text.trim(),
      'ownerName': ownerNameController.text.trim(),
      'email': emailController.text.trim(),
      'address': addressController.text.trim(),
      'openTime': openTimeController.text.trim(),
      'closeTime': closeTimeController.text.trim(),
    };

    // Simulate a delay (optional)
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => isSubmitting = false);

      // Navigate to business dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BusinessHomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Registration", style: TextStyle(color: Colors.white)),
        backgroundColor: themeColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField(shopNameController, "Shop Name"),
              _buildField(ownerNameController, "Owner Name"),
              _buildField(emailController, "Business Email", TextInputType.emailAddress),
              _buildField(addressController, "Shop Address"),
              _buildField(openTimeController, "Opening Time (e.g., 9:00 AM)"),
              _buildField(closeTimeController, "Closing Time (e.g., 6:00 PM)"),
              const SizedBox(height: 30),
              isSubmitting
                  ? const CircularProgressIndicator()
                  : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Register Business",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label, [TextInputType type = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: (value) => value == null || value.trim().isEmpty ? 'Enter $label' : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
