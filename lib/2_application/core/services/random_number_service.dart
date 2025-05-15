import 'dart:math';

int generateRandom10DigitNumber() {
  final random = Random();
  const length = 5;

  // Generate a random 10-digit number as a string
  final randomDigits =
      List.generate(length, (index) => random.nextInt(5)).join();

  // Convert the string to an integer and ensure it's positive
  return int.parse(randomDigits);
}
