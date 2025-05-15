import 'package:flutter/material.dart';

class ReactionPopup extends StatelessWidget {
  final List<String> reactions;
  final Function(String) onReactionSelected;

  const ReactionPopup(
      {super.key, required this.reactions, required this.onReactionSelected});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: reactions.map((reaction) {
            return GestureDetector(
              onTap: () {
                onReactionSelected(reaction);
                Navigator.of(context).pop(); // Close the popup
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(reaction, style: const TextStyle(fontSize: 24)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
