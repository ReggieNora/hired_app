import 'package:flutter/material.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _userType = 'seeker'; // default selection

  void _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SignupScreen(userType: _userType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleButtons(
            isSelected: [_userType == 'seeker', _userType == 'employer'],
            onPressed: (int index) {
              setState(() {
                _userType = index == 0 ? 'seeker' : 'employer';
              });
            },
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Job Seeker'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Employer'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _navigateToSignup,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
