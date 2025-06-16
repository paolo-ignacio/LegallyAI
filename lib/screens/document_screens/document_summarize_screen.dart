import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:legallyai/screens/document_screens/chatbot_screen.dart';

class DocumentSummarizeScreen extends StatelessWidget {
  DocumentSummarizeScreen({super.key});

  final List<String> titles = [
    'Summary Highlights',
    'Key Clauses',
    'Actionable Insights',
    'Risks & Recommendations'
  ];

  final List<String> content = [
    '''This document serves as a legally binding agreement outlining the roles and expectations of all parties involved. Key deliverables include project milestones, payment schedules, and approval workflows. The document was signed on April 10, 2025, and will remain in effect for 12 months unless terminated earlier.''',
    '''Clause 2.1 details the scope of work, including what services are to be delivered. 
Clause 4.2 limits liability for indirect damages. 
Clause 6.1 allows termination with a 30-day notice.
Clause 7.3 contains a non-compete clause active for 6 months post-contract.
Appendix B lists the SLA terms for service outages.''',
    '''• Schedule an internal legal review before final approval.
• Highlight Clause 4.2 in the client handover for transparency.
• Confirm that all annexed schedules (A, B, C) are the most recent versions.
• Consider negotiating the 30-day termination notice to 15 days for flexibility.''',
    '''• Risk: The non-compete clause might restrict future partnerships.
• Risk: The termination clause lacks provisions for early dispute resolution.
• Recommendation: Add a clause requiring periodic review of deliverables every quarter.
• Recommendation: Ensure both parties acknowledge SLA breach penalties.''',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2A2A3C),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Document Summary",
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titles[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const Gap(12),
                  Text(
                    content[index],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatbotScreen()));
        },
        backgroundColor: const Color(0xFFD4AF37),
        shape: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(
            'assets/icons/chatbot.png',
            width: 28,
            height: 28,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
