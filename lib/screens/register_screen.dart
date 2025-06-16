import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:legallyai/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final keyForm = GlobalKey<FormState>();

  final emailCtrl = TextEditingController();
  final fnameCtrl = TextEditingController();
  final lnameCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool hidePassword = true;
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Form(
              key: keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', height: 100),
                  const Gap(24),
                  Text(
                    "Join LelgallyAI!",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(8),
                  Text(
                    "Start simplifying legal complexities today.",
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(24),

                  // Card-style form container
                  Column(
                    children: [
                      TextFormField(
                        controller: fnameCtrl,
                        decoration: setTextDecoration('First Name'),
                        validator: (value) =>
                            value == null || value.isEmpty ? "*First name is required." : null,
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: lnameCtrl,
                        decoration: setTextDecoration('Last Name'),
                        validator: (value) =>
                            value == null || value.isEmpty ? "*Last name is required." : null,
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: emailCtrl,
                        decoration: setTextDecoration('Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "*Email is required.";
                          if (!EmailValidator.validate(value)) return "*Invalid email address.";
                          return null;
                        },
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: passwordCtrl,
                        obscureText: hidePassword,
                        decoration: setTextDecoration('Password', isPasswordFieldTrue: true),
                        validator: (value) =>
                            value == null || value.isEmpty ? "*Password is required." : null,
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: confirmPassCtrl,
                        obscureText: hidePassword,
                        decoration: setTextDecoration('Retype Password', isPasswordFieldTrue: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "*Password is required.";
                          if (passwordCtrl.text != value) return "*Passwords do not match.";
                          return null;
                        },
                      ),
                      const Gap(16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isAgree,
                            activeColor: theme.colorScheme.primary,
                            onChanged: (value) => setState(() => isAgree = value!),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(fontSize: 12, color: Colors.white),
                                  children: [
                                    TextSpan(text: "I understand and agree to the "),
                                    TextSpan(
                                      text:
                                          "LegallyAI terms of service including User Agreement and Privacy Policy.",
                                      style: TextStyle(color: Color(0xFFD4AF37)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!keyForm.currentState!.validate()) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: const Text("Sign up"),
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.primary,
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
      ),
    );
  }

  InputDecoration setTextDecoration(String label, {bool isPasswordFieldTrue = false}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[700]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
      ),
      suffixIcon: isPasswordFieldTrue
          ? IconButton(
              icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.white70,
              ),
              onPressed: () => setState(() => hidePassword = !hidePassword),
            )
          : null,
    );
  }
}
