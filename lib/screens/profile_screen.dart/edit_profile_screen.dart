import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentEmail;

  const EditProfileScreen({
    super.key,
    this.currentName = "John Doe",
    this.currentEmail = "johndoe@example.com",
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.currentName);
    emailCtrl = TextEditingController(text: widget.currentEmail);
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
        backgroundColor: const Color(0xFF2A2A3C),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/images/avatar_placeholder.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Icon(Icons.add_a_photo_rounded, color: Colors.black87, size: 20,)),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: nameCtrl,
                    decoration: _inputDecoration("First Name"),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Name can't be empty" : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: nameCtrl,
                    decoration: _inputDecoration("Last Name"),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Name can't be empty" : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: emailCtrl,
                    decoration: _inputDecoration("Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || value.isEmpty ? "Email can't be empty" : null,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD4AF37),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // You can handle update logic here (e.g., Firebase update)
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Profile updated')),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Save Changes"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.black87),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
    );
  }
}
