import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class BrowseScreen extends StatelessWidget {
  final List<Map<String, String>> jobs = [
    {
      'role': 'Frontend Developer',
      'salary': '\$80k',
      'location': 'Remote',
      'skills': 'Flutter, Dart, Firebase',
      'experience': '3 years',
      'linkedin': 'linkedin.com/in/dev1'
    },
    {
      'role': 'Backend Engineer',
      'salary': '\$95k',
      'location': 'San Francisco',
      'skills': 'Node.js, MongoDB, AWS',
      'experience': '5 years',
      'linkedin': 'linkedin.com/in/dev2'
    },
    {
      'role': 'UI/UX Designer',
      'salary': '\$75k',
      'location': 'Remote',
      'skills': 'Figma, Adobe XD, UX Research',
      'experience': '4 years',
      'linkedin': 'linkedin.com/in/designer1'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Browse Jobs")),
      body: PageView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Center(
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Role: ${job['role']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Salary: ${job['salary']}", style: TextStyle(fontSize: 16)),
                      Text("Location: ${job['location']}", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 20),
                      Text("Tap to flip for more", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              back: Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Skills: ${job['skills']}", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text("Experience: ${job['experience']}", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text("LinkedIn: ${job['linkedin']}", style: TextStyle(fontSize: 16, color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
