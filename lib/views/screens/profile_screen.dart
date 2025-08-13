import 'package:finsense/constants/colors.dart';
import 'package:finsense/views/screens/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;

  const ProfileScreen({super.key, required this.userName});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double? monthlyBudget;
  double? dailyBudget;
  String? overBudgetMessage;

  final TextEditingController monthlyController = TextEditingController();
  final TextEditingController dailyController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _showSetBudgetSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes it responsive with keyboard
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Set Your Budget",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: monthlyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Monthly Budget",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: dailyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Daily Budget",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  labelText: "Over-Budget Alert Message",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () {
                  setState(() {
                    monthlyBudget =
                        double.tryParse(monthlyController.text.trim());
                    dailyBudget =
                        double.tryParse(dailyController.text.trim());
                    overBudgetMessage = messageController.text.trim();
                  });
                  Navigator.pop(context);
                },
                child: const Text("Save Budget"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    monthlyController.dispose();
    dailyController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        children: [
          // Profile Header
          Container(
            padding: const EdgeInsets.all(20),
            color: AppColors.secondary,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.userName,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Set Budget
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListTile(
              leading: const Icon(Icons.account_balance_wallet,
                  color: Colors.teal),
              title: const Text("Set Budget"),
              subtitle: monthlyBudget != null
                  ? Text(
                      "Monthly: ₹${monthlyBudget!.toStringAsFixed(0)}, Daily: ₹${dailyBudget?.toStringAsFixed(0)}")
                  : const Text("No budget set"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _showSetBudgetSheet,
            ),
          ),
          const Divider(height: 1),
          const SizedBox(height: 20),

          // Settings
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListTile(
              leading: const Icon(Icons.settings, color: Colors.teal),
              title: const Text("Settings"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to settings screen
              },
            ),
          ),
          const Divider(height: 1),
          const SizedBox(height: 20),

          // Export File
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListTile(
              leading: const Icon(Icons.download, color: Colors.teal),
              title: const Text("Export File"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Trigger export function
              },
            ),
          ),
          const Divider(height: 1),
          const SizedBox(height: 20),

          // Logout
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}