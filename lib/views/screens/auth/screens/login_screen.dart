import 'package:finsense/common/custom_text_form_field.dart';
import 'package:finsense/common/widgets/bootom_bar.dart';
import 'package:finsense/constants/colors.dart';
import 'package:finsense/views/screens/auth/screens/singup_screen.dart';
import 'package:finsense/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      // TODO: Connect to backend API here
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  BottomBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("FinSense"),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height : 70,
            width : 130,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(10)
            ),
           alignment: Alignment.center,
             child: Text('Log In', style : TextStyle(color : Colors.white,fontSize: 25))
          ), 
          const SizedBox(height: 20),
          Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  controller: emailController,
                  label: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Enter your email";
                    if (!value.contains("@")) return "Enter a valid email";
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  controller: passwordController,
                  isPassword: true,
                  label : "Password",
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: login,
                  child: const Text("Login"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text("Don't have an account? Sign Up"),
                )
              ],
            ),
          ),
        )
        ]
        ),
    );
  }
}