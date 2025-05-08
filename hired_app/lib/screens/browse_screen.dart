import 'package:hired_app/widgets/swipe_deck.dart';
import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = List.generate(
      5,
      (index) => Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text('Job Card #$index', style: Theme.of(context).textTheme.headlineSmall),
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SwipeDeck(cards: cards),
    );
  }
}
