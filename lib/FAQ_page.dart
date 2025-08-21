import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FAQPage(),
      theme: ThemeData(
       
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class FAQPage extends StatefulWidget {
  const FAQPage();

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<Map<String, String>> faqItems = [
    {
      'question': 'Security',
      'answer': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Suspendisse potenti. Nam non nunc eu leo ultricies facilisis. Sed euismod, libero quis consequat viverra, orci est feugiat mi, in feugiat libero ex non enim.',
    },
    {
      'question': 'Account Settings',
      'answer': 'This section covers questions related to your account, including profile information and preferences.',
    },
    {
      'question': 'Payment Information',
      'answer': 'This section contains answers about billing, subscriptions, and payment methods.',
    },
    {
      'question': 'Troubleshooting',
      'answer': 'Find solutions to common issues and technical problems here.',
    },
    {
      'question': 'Privacy Policy',
      'answer': 'Learn more about how we handle your data and our privacy practices.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF333333),
                size: 20,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'FAQ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Expanded(
              child: ListView.builder(
                itemCount: faqItems.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(
                      faqItems[index]['question']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          faqItems[index]['answer']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
