import 'package:finsense/common/custom_text_form_field.dart';
import 'package:finsense/constants/colors.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signup() {
    if (_formKey.currentState!.validate()) {
      // TODO: Connect to backend API here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signed up successfully!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
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
             child: Text('Sign Up', style : TextStyle(color : Colors.white,fontSize: 25)),
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
                             keyboardType: TextInputType.emailAddress,
                             validator: (value) {
                                if (value == null || value.isEmpty) return "Enter your email";
                                if (!value.contains("@")) return "Enter a valid email";
                                return null;
                              },
                            ),

              const SizedBox(height: 15),
               CustomTextFormField(
                controller: passwordController,
                  label: "Password",
                      isPassword: true,
                        validator: (value) {
                    if (value == null || value.length < 6) return "Password must be at least 6 characters";
                       return null;
                     },
                      ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: confirmPasswordController,
                isPassword: true,
                label: "Confirm Password",
                validator: (value) {
                  if (value != passwordController.text) {
                    return "Passwords do not match";
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
                onPressed: signup,
                child: const Text("Sign Up"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text("Already have an account? Login"),
              )
            ],
          ),
        ),
      ),

          ]
        ),
    );
  }
}

