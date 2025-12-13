import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'globals_dynamic.dart'; // <-- Global appointments list

class BookAppointmentScreen extends StatefulWidget {
  final String categoryName;
  final String? shopName;

  const BookAppointmentScreen({
    super.key,
    required this.categoryName,
    this.shopName,
  });

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void _pickDate() async {

  }

  void _pickTime() async {

  }

  void _submit() {
    if (nameController.text.isEmpty || phoneController.text.isEmpty ) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    // Save appointment
    confirmedAppointments.add({
      'name': nameController.text,
      'phone': phoneController.text,

      'category': widget.categoryName,
      'shop': widget.shopName ?? 'N/A',
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Appointment booked successfully!")),
    );

    Navigator.pop(context); // Close the screen
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.blue[900];

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Appointment", style: const TextStyle(color: Colors.white)),
        backgroundColor: themeColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Booking for ${widget.categoryName}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: themeColor),
            ),
            if (widget.shopName != null) ...[
              const SizedBox(height: 6),
              Text(
                "At: ${widget.shopName!}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[700]),
              ),
            ],
            const SizedBox(height: 30),
            _buildInput(label: "Your Name", controller: nameController, icon: Icons.person),
            const SizedBox(height: 16),
            _buildInput(
                label: "Phone Number",
                controller: phoneController,
                icon: Icons.phone,
                keyboardType: TextInputType.phone),
            const SizedBox(height: 16),
            _buildDateTimeButton(
              label: "Select Date",
              value: selectedDate != null
                  ? DateFormat('dd MMM, yyyy').format(selectedDate!)
                  : "Pick Date",
              icon: Icons.date_range,
              onTap: _pickDate,
            ),
            const SizedBox(height: 12),
            _buildDateTimeButton(
              label: "Select Time",
              value: selectedTime != null ? selectedTime!.format(context) : "Pick Time",
              icon: Icons.access_time,
              onTap: _pickTime,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text("Confirm Appointment", style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: _submit,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }

  Widget _buildDateTimeButton({
    required String label,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.grey[100],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue[700]),
            const SizedBox(width: 16),
            Text(value, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
