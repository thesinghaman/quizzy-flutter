import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  // Declare a final property 'startQuiz' that stores the function to start the quiz
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    // Create a Column to organize widgets vertically
    return Column(
      children: [
        const SizedBox(height: 25), // Add vertical space

        // Display the title 'QUIZZY FLUTTER' with specific style
        const Text(
          'QUIZZY FLUTTER',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(166, 172, 175, 1),
          ),
        ),

        const SizedBox(height: 100), // Add vertical space

        // Display an image from the assets folder
        Image.asset(
          'assets/images/quiz-logo.png', // Image path
          width: 300, // Set image width
        ),

        const SizedBox(height: 100), // Add vertical space

        // Display the subtitle 'Learn Flutter The Fun Way !!' with specific style
        const Text(
          'Learn Flutter The Fun Way !!',
          style: TextStyle(fontSize: 27, color: Colors.white),
        ),

        const SizedBox(height: 50), // Add vertical space

        // Create an ElevatedButton with specific style to start the quiz
        ElevatedButton.icon(
          onPressed: startQuiz, // Define the function to execute when pressed
          style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
            foregroundColor: const Color.fromRGBO(40, 40, 43, 1),
            backgroundColor: const Color.fromRGBO(26, 188, 156, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          label: const Text(
            'Start Quiz', // Button label
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          icon:
              const Icon(Icons.arrow_forward_ios), // Add an icon to the button
        ),
      ],
    );
  }
}
