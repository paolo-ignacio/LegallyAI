import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:legallyai/screens/main_screen.dart';
import 'package:legallyai/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final keyForm = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Form(
            key: keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
                const Gap(32),
                Text(
                  "Welcome back to LegallyAI!",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(8),
                Text(
                  "Please login with your credentials",
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
                const Gap(32),
                Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: setTextDecoration('Email'),
                      controller: emailCtrl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Email is required.";
                        }
                        if (!EmailValidator.validate(value)) {
                          return "*Invalid email address.";
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    TextFormField(
                      obscureText: hidePassword,
                      decoration: setTextDecoration('Password', isPasswordField: true),
                      controller: passwordCtrl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Password is required.";
                        }
                        return null;
                      },
                    ),
                    const Gap(32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!keyForm.currentState!.validate()) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainScreen()),
                          );
                        },
                        child: const Text("Login"),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration setTextDecoration(String label, {bool isPasswordField = false}) {
    return InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(color: Colors.black54),
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      ),
      suffixIcon: isPasswordField
          ? IconButton(
              onPressed: toggleShowPassword,
              icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
              ),
            )
          : null,
    );
  }

  void toggleShowPassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }
}
