import 'package:flutter/material.dart'; 
import 'package:gap/gap.dart';
import 'package:legallyai/screens/chatbot_screens/main_chatbot.dart';
import 'package:legallyai/screens/profile_screen.dart/profile_main.dart';
import 'package:legallyai/screens/document_screens/scanning.dart';
import 'package:legallyai/screens/login_screen.dart';
import 'package:legallyai/screens/template_screens/templates.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> texts = ['Chatbot', 'Review', 'Templates', 'Others'];
  final List<IconData> icons = [
    Icons.reviews,
    Icons.document_scanner,
    Icons.description,
    Icons.more_horiz,
  ];

  final List<String> textFiles = [
    'Business Contract',
    'Employment Contract',
    'Lease Agreement',
  ];

  final List<Color> colorsDocs = [Color(0xFFD4AF37), Color(0xFF7E57C2), Color(0xFF4CAF50)];
  final List<Color?> colorsbf = [Color(0xFF3B3B4F), Color(0xFF3E345E), Color(0xFF2C4F3C)];

  final List<Widget> linksScreen = [ChatbotScreen(), OCRScannerScreen(), TemplatesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(context),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gradient background container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1C1C2E), Color(0xFF2A2A3C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(15),
                  _buildAppBar(context),
                  const Gap(24),
                  const Gap(10),
                  _buildQuickTools(context),
                  
                ],
              ),
            ),
            const Gap(25),
            _sectionTitle("Recent Files"),
            const Gap(10),
            _buildRecentFiles(),
            const Gap(30),
            _sectionTitle("Sample Templates"),
            const Gap(10),
            _buildSampleTemplates(),
            const Gap(30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => OCRScannerScreen()));
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.document_scanner_rounded, color: Color(0xFF2A2A3C)),
        shape: const CircleBorder(),
        elevation: 10,
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        Row(
          children: [
            Text(
              "Legally",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            Text(
              "AI",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfileScreen()));
          },
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF1C1C2E),
                ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 2,
            width: 40,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    ),
  );
}


  Widget _buildQuickTools(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: icons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              if (index < linksScreen.length) {
                Navigator.push(context, MaterialPageRoute(builder: (_) => linksScreen[index]));
              }
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Icon(icons[index], color: Theme.of(context).primaryColor, size: 28),
                ),
                const Gap(10),
                Text(texts[index],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentFiles() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/images/docs.png',
                    height: 100,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C2E),
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Document ${index + 1}",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                      Text("Created at: 02-23-25", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSampleTemplates() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: textFiles.length,
        itemBuilder: (_, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colorsbf[index],
                child: Icon(Icons.file_copy, color: colorsDocs[index]),
              ),
              title: Text(
                textFiles[index],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black38, size: 18),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }


  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Theme.of(context).primaryColor, size: 40),
                ),
                const Gap(10),
                Text("User Name", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: Text('Home', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.reviews, color: Colors.white),
            title: Text('Chatbot', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.document_scanner, color: Colors.white),
            title: Text('Review', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.file_copy_rounded, color: Colors.white),
            title: Text('Library', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.white),
            title: Text('Help', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.white),
            title: Text('Logout', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}