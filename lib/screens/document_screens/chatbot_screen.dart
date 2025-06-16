import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:gap/gap.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'from': 'bot', 'text': 'What would you like to know about this document?'},
    {'from': 'user', 'text': 'Explain clause 5'},
    {
      'from': 'bot',
      'text': '''
**Clause 5 – Termination Overview**

This clause typically includes:

• **Termination Conditions**: Either party can terminate the agreement with 30 days’ written notice.

• **Breach of Contract**: Immediate termination may occur if any material terms are violated.

• **Post-Termination Responsibilities**:
  - Return of proprietary documents  
  - Final payments or reimbursements  
  - Continued confidentiality obligations

This ensures both parties understand how and when the contract can be legally ended.
'''
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildMessage(Map<String, dynamic> msg) {
    final isBot = msg['from'] == 'bot';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isBot)
            ClipOval(
              child: Container(
                color: const Color(0xFF8e84cc),
                width: 42,
                height: 42,
                child: Center(
                  child: Image.asset(
                    'assets/icons/chatbot.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          if (isBot) const SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isBot ? const Color(0xFFF1F1F1) : const Color(0xFFD4AF37),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isBot ? 4 : 16),
                  bottomRight: Radius.circular(isBot ? 16 : 4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: MarkdownBody(
                data: msg['text'],
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(
                    fontSize: 14,
                    color: isBot ? Colors.black87 : Colors.black,
                    height: 1.5,
                  ),
                  strong: const TextStyle(fontWeight: FontWeight.bold),
                  listBullet: TextStyle(
                    fontSize: 14,
                    color: isBot ? Colors.black87 : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light mode background
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A2A3C), // Dark AppBar
        title: const Text("Chatbot", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (_, index) =>
                      _buildMessage(_messages[_messages.length - 1 - index]),
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
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
                  const Gap(12),
                  Material(
                    color: const Color(0xFFD4AF37),
                    shape: const CircleBorder(),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Color(0xFF2A2A3C)),
                      onPressed: () {
                        if (_controller.text.trim().isNotEmpty) {
                          setState(() {
                            _messages.add({
                              'from': 'user',
                              'text': _controller.text.trim()
                            });
                          });
                          _controller.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
