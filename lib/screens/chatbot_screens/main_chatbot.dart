import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChatbotScreen extends StatelessWidget {
  ChatbotScreen({super.key});

  final List<String> texts = [
    'Review Legal Documents\n(Upload documents to get summaries, key points, and important highlights.)',
    'Answer Your Legal Questions\n(Ask about legal terms, contracts, or clauses — I’ll explain them in simple terms.)',
    'Compare Documents\n(Spot differences between legal documents and identify changes easily.)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 1,
        backgroundColor:Color(0xFF2A2A3C),
        foregroundColor: Colors.white,
        title: Text(
          "Chatbot",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Gap(30),

              // Logo/Icon
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                ),
                child: Icon(Icons.document_scanner_rounded,
                    size: 64, color: Theme.of(context).primaryColor),
              ),

              const Gap(30),

              // Capabilities Title
              Text(
                "Capabilities",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),

              const Gap(20),

              // Capability Cards
              Expanded(
                child: ListView.separated(
                  itemCount: texts.length,
                  separatorBuilder: (_, __) => const Gap(16),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        texts[index],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black87,
                              height: 1.4,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),

              const Gap(12),

              Text(
                "These are just a few examples of what I can do.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              const Gap(20),

              // Message Form
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Ask me anything...',
                        hintStyle: const TextStyle(color: Colors.black54),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Material(
                    color: Theme.of(context).primaryColor,
                    shape: const CircleBorder(),
                    child: IconButton(
                      iconSize: 28,
                      icon: Icon(Icons.send, color: Color(0xFF2A2A3C)),
                      onPressed: () {
                        // Handle send action
                      },
                    ),
                  ),
                ],
              ),

              const Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
