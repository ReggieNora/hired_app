import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _users = [
    User(
      name: 'Alice',
      age: 26,
      bio: 'Software engineer and coffee lover.',
      imageUrl: 'https://i.pravatar.cc/300?img=1',
    ),
    User(
      name: 'Bob',
      age: 30,
      bio: 'Freelance designer and traveler.',
      imageUrl: 'https://i.pravatar.cc/300?img=2',
    ),
    // Add more sample users as needed
  ];

  int _currentIndex = 0;

  List<User> get users => _users;
  int get currentIndex => _currentIndex;
  User? get topUser => _currentIndex < _users.length ? _users[_currentIndex] : null;

  void swipeLeft() {
    _removeTopCard();
  }

  void swipeRight() {
    _removeTopCard();
  }

  void _removeTopCard() {
    if (_currentIndex < _users.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }
}
