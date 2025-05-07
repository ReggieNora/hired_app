import 'package:flutter/material.dart';
import 'seeker_dashboard.dart';
import 'employer_dashboard.dart';

class SignupScreen extends StatelessWidget {
  final String userType;

  const SignupScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (userType == 'seeker') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SeekerDashboard()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const EmployerDashboard()),
              );
            }
          },
          child: Text('Finish Signup as ${userType == 'seeker' ? 'Job Seeker' : 'Employer'}'),
        ),
      ),
    );
  }
}
