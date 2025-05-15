import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vicefree/2_application/core/widgets/button.dart';

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails details;

  const CustomErrorWidget(this.details, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            try {
              context.pop();
            } catch (_) {
              context.replace('/login');
            }
          },
        ),
        title: const Text('Error Occurred'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 100, color: Colors.red),
            const SizedBox(height: 20),
            const Text(
              'Oops! Something went wrong.',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            CustomButton(
              minimumSize: const Size(150, 50),
              onTap: () {
                try {
                  context.pop();
                } catch (_) {
                  context.replace('/login');
                }
              },
              text: 'Go back',
            ),
          ],
        ),
      ),
    );
  }
}
