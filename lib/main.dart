
import 'package:flutter/material.dart';

void main() {
  runApp(const HealthScanApp());
}

class HealthScanApp extends StatelessWidget {
  const HealthScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HEALTH SCAN AI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E8B),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> modules = const [
    {'name': 'Heart & ECG', 'bn': 'হার্ট ও ECG বিশ্লেষণ', 'icon': Icons.monitor_heart},
    {'name': 'Brain & Stroke', 'bn': 'মস্তিষ্ক ও স্ট্রোক সতর্কতা', 'icon': Icons.psychology},
    {'name': 'Bone & Injury', 'bn': 'হাড় ও আঘাত বিশ্লেষণ', 'icon': Icons.accessibility_new},
    {'name': 'Blood Analysis', 'bn': 'রক্ত পরীক্ষার রিপোর্ট', 'icon': Icons.bloodtype},
    {'name': 'MRI / CT / X-Ray', 'bn': 'মেডিকেল ইমেজ ও রিপোর্ট', 'icon': Icons.document_scanner},
    {'name': 'Emergency First Aid', 'bn': 'জরুরি প্রাথমিক চিকিৎসা', 'icon': Icons.medical_services},
    {'name': 'Body Scan', 'bn': 'শরীরের সামগ্রিক স্বাস্থ্যতথ্য', 'icon': Icons.health_and_safety},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF073B4C),
        foregroundColor: Colors.white,
        title: const Text(
          'HEALTH SCAN AI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'HEALTH SCAN AI',
                applicationVersion: '0.1.0',
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF073B4C), Color(0xFF087E8B)],
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ADAPTIVE MULTIMODAL MEDICAL AI',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(height: 15),
                Text(
                  'Your Health,\\nOur Intelligent Support',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'স্বাস্থ্যতথ্য বুঝুন, সতর্কতার লক্ষণ জানুন এবং সঠিক পরবর্তী পদক্ষেপ সম্পর্কে সহায়তা নিন।',
                  style: TextStyle(color: Colors.white, height: 1.6),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Medical Scan Modules',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...modules.map((item) {
            return Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 11),
              color: Colors.white,
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xFFE0F2F1),
                  child: Icon(
                    item['icon'] as IconData,
                    color: const Color(0xFF087E8B),
                  ),
                ),
                title: Text(
                  item['name'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item['bn'] as String),
                trailing: const Icon(Icons.arrow_forward_ios, size: 17),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        title: item['name'] as String,
                        description: item['bn'] as String,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'গুরুত্বপূর্ণ সতর্কতা: এই অ্যাপটি বর্তমানে একটি প্রাথমিক প্রোটোটাইপ। এটি রোগ নির্ণয় বা চিকিৎসার বিকল্প নয়। জরুরি অবস্থায় দ্রুত চিকিৎসা সহায়তা নিন।',
              style: TextStyle(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String description;

  const DetailPage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(description, style: const TextStyle(fontSize: 17)),
            const SizedBox(height: 20),
            const Text(
              'এই মডিউলের AI বিশ্লেষণ, রিপোর্ট আপলোড এবং মেডিকেল ডেটা সংযোগ পরবর্তী সংস্করণে যুক্ত করা হবে।',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
