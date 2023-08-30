import 'package:flutter/material.dart';

import './answer_button.dart';
import '/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  // Declare a final property 'onSelectAnswer' that stores a function
  final void Function(String answer) onSelectAnswer;

  // Create the state for the QuestionsScreen
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

// Define the state for the QuestionsScreen
class _QuestionsScreenState extends State<QuestionsScreen> {
  // Declare a variable to track the index of the current question
  var currentQuestionIndex = 0;

  // Function to handle answering a question
  void answerQuestion(String selectedAnswer) {
    // Call the 'onSelectAnswer' function provided in the constructor with the selected answer
    widget.onSelectAnswer(selectedAnswer);

    // Update the state to move to the next question
    setState(() {
      currentQuestionIndex++;
    });
  }

  // Build method: This method defines how the widget should be displayed.
  @override
  Widget build(context) {
    // Get the current question using the 'currentQuestionIndex'
    final currentQuestion = questions[currentQuestionIndex];

    // Create a SizedBox with a width of the entire screen
    return SizedBox(
      width: double.infinity,
      // Create a Container with margin and child
      child: Container(
        margin: const EdgeInsets.all(45),
        // Create a Column to organize widgets vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display the text of the current question with specific style and alignment
            Text(
              currentQuestion.text,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50), // Add vertical space

            // Use map to create a list of AnswerButton widgets for each shuffled answer
            ...currentQuestion.getShuffledAnswers().map((item) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Create an AnswerButton widget with the shuffled answer text
                  AnswerButton(item, () {
                    // When the button is pressed, call the 'answerQuestion' function with the selected answer
                    answerQuestion(item);
                  }),
                  const SizedBox(height: 10), // Add vertical space
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
