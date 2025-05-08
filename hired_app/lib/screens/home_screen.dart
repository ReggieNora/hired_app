import 'package:flutter/material.dart';
import '../widgets/user_card.dart';
import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<User> users = const [
    User(name: 'Bob', age: 30, bio: 'Freelance designer and traveler.'),
    User(name: 'Anna', age: 27, bio: 'Photographer and cat lover.'),
    User(name: 'Leo', age: 35, bio: 'Musician. Just moved to town.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            'Hired',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: UserCard(user: users[index]),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
