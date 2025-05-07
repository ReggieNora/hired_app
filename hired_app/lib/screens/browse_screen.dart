import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final List<Map<String, String>> jobs = [
    {
      'title': 'UX Designer',
      'company': 'Pixel Labs',
      'location': 'Remote',
    },
    {
      'title': 'Flutter Developer',
      'company': 'CodeCraft',
      'location': 'New York, NY',
    },
    {
      'title': 'Marketing Manager',
      'company': 'BrandHype',
      'location': 'Los Angeles, CA',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Swiper(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return JobCard(job: job);
        },
        layout: SwiperLayout.STACK,
        onIndexChanged: (index) {
          print('Swiped to card $index');
        },
        onTap: (index) {
          print('Tapped on card $index');
        },
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Map<String, String> job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              job['title'] ?? '',
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              job['company'] ?? '',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(
              job['location'] ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
