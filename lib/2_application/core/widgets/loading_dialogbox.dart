import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context, String? text) {
  var color = Theme.of(context).colorScheme;

  showDialog(
    context: context,
    barrierDismissible:
        true, // Prevents dialog from being dismissed by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: color.secondary,
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Text(
              text ?? 'Loading...',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    },
  );
}
