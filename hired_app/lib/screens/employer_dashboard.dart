import 'package:flutter/material.dart';

class EmployerDashboard extends StatelessWidget {
  const EmployerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employer Dashboard')),
      body: const Center(
        child: Text('Welcome, Employer!'),
      ),
    );
  }
}
