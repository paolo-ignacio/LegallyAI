import 'package:flutter/material.dart';
import 'package:legallyai/screens/document_screens/document_summarize_screen.dart';

class OCRScannerScreen extends StatefulWidget {
  const OCRScannerScreen({super.key});

  @override
  _OCRScannerScreenState createState() => _OCRScannerScreenState();
}

class _OCRScannerScreenState extends State<OCRScannerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _positionAnimation;
  late Animation<double> _iconOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _positionAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Fade in and out the icon during the scanning effect
    _iconOpacityAnimation = Tween<double>(begin: 1.0, end: 0.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double frameSize = MediaQuery.of(context).size.width * 0.75;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A2A3C),
        foregroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "OCR Scanner",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DocumentSummarizeScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: frameSize,
                      height: frameSize,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Fading scanner icon
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _iconOpacityAnimation.value,
                                child: const Icon(
                                  Icons.document_scanner,
                                  color: Color.fromRGBO(212, 175, 55, 1),
                                  size: 200,
                                ),
                              );
                            },
                          ),
                          // The scanning line with gradient fade
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, _positionAnimation.value * (frameSize / 2.5 - 10)),
                                child: Container(
                                  width: frameSize * 0.7,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(212, 175, 55, 1).withOpacity(0.0),
                                        const Color.fromRGBO(212, 175, 55, 1).withOpacity(0.5),
                                        Color.fromRGBO(212, 175, 55, 1).withOpacity(0.0),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height:0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    "Please take a moment while we are scanning your document...",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
