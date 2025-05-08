import 'package:flutter/material.dart';

class SwipeDeck extends StatefulWidget {
  final List<Widget> cards;

  const SwipeDeck({Key? key, required this.cards}) : super(key: key);

  @override
  State<SwipeDeck> createState() => _SwipeDeckState();
}

class _SwipeDeckState extends State<SwipeDeck> {
  int topCardIndex = 0;
  Offset cardOffset = Offset.zero;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      cardOffset += details.delta;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final threshold = screenWidth * 0.3;

    if (cardOffset.dx > threshold) {
      // Swiped right
      _swipeCard();
    } else if (cardOffset.dx < -threshold) {
      // Swiped left
      _swipeCard();
    } else {
      // Not far enough, reset
      setState(() {
        cardOffset = Offset.zero;
      });
    }
  }

  void _swipeCard() {
    setState(() {
      topCardIndex++;
      cardOffset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (topCardIndex >= widget.cards.length) {
      return const Center(child: Text('No more cards'));
    }

    return Stack(
      children: widget.cards
          .asMap()
          .entries
          .where((entry) => entry.key >= topCardIndex)
          .map((entry) {
        final index = entry.key;
        final card = entry.value;
        final isTop = index == topCardIndex;

        return Positioned.fill(
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: screenWidth * 0.85,
              height: screenHeight * 0.65,
              child: isTop
                  ? GestureDetector(
                      onPanUpdate: _onPanUpdate,
                      onPanEnd: _onPanEnd,
                      child: Transform.translate(
                        offset: cardOffset,
                        child: card,
                      ),
                    )
                  : card,
            ),
          ),
        );
      }).toList(),
    );
  }
}
