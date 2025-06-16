import 'package:flutter/material.dart';
import 'package:legallyai/components/dark_mode.dart';
import 'package:legallyai/components/light_mode.dart';
import 'package:legallyai/provider/theme_provider.dart';
import 'package:legallyai/screens/login_screen.dart';
import 'package:legallyai/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'LegallyAI',
          theme: legallyAiTheme,
          home: MainScreen(),
        );
      },
    );
  }
}
