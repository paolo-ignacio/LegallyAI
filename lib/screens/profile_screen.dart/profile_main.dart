import 'package:flutter/material.dart';
import 'package:legallyai/screens/profile_screen.dart/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const ProfileScreen({
    super.key,
    this.userName = "John Doe",
    this.userEmail = "johndoe@example.com",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: const Color(0xFF2A2A3C),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/avatar_placeholder.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: IconButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => EditProfileScreen()));
                          }, icon: Padding(
                            padding: const EdgeInsets.only(right: 2.0, bottom: 2.0),
                            child: Icon(Icons.edit, color: Colors.black87, size: 20,),
                          ),)
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  userName,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  userEmail,
                  style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Account info section
                Text("Account Info", style: theme.textTheme.titleMedium?.copyWith(color: Colors.black87)),
                const SizedBox(height: 10),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        profileInfoRow(Icons.person, "Full Name", userName),
                        const Divider(color: Colors.black12),
                        profileInfoRow(Icons.email, "Email", userEmail),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Settings section
                Text("Settings", style: theme.textTheme.titleMedium?.copyWith(color: Colors.black87)),
                const SizedBox(height: 10),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        profileOptionRow(Icons.help, "Help"),
                        const Divider(color: Colors.black12),
                        profileOptionRow(Icons.settings, "Settings"),
                      ],
                    ),
                  ),
                ),

                const Spacer(),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.logout, color: Colors.black),
                    label: const Text("Logout"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.black54),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(color: Colors.black45, fontSize: 13)),
              Text(value,
                  style: const TextStyle(color: Colors.black87, fontSize: 15)),
            ],
          ),
        ),
      ],
    );
  }

  Widget profileOptionRow(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.black54),
        const SizedBox(width: 12),
        Text(title,
            style: const TextStyle(color: Colors.black87, fontSize: 15)),
      ],
    );
  }
}
