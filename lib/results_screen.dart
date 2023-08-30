import 'package:flutter/material.dart';

import '/data/questions.dart';
import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  // Declare final properties to store chosen answers and the 'onRestart' function
  final List<String> chosenAnswers;
  final void Function() onRestart;

  // Function to generate summary data for questions and answers
  List<Map<String, Object>> getSummaryData() {
    // Create an empty list to store summary data
    final List<Map<String, Object>> summary = [];

    // Iterate through chosen answers and create summary data for each question
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary; // Return the generated summary data list
  }

  @override
  Widget build(BuildContext context) {
    // Get the summary data for questions and answers
    final summaryData = getSummaryData();

    // Calculate the total number of questions and the number of correctly answered questions
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;

    // Create a SizedBox widget with a width of the entire screen
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45), // Apply margin to the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the results message with the number of correct and total questions
            Text(
              "You answered $numCorrectQuestions questions out of $numTotalQuestions questions correctly.",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), // Add vertical space

            // Display the summary of questions and answers using QuestionsSummary widget
            QuestionsSummary(summaryData: summaryData),

            const SizedBox(height: 30), // Add vertical space

            // Create an ElevatedButton with a custom style
            ElevatedButton.icon(
              onPressed:
                  onRestart, // Define the function to execute when pressed
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 10, bottom: 10),
                foregroundColor: const Color.fromRGBO(40, 40, 43, 1),
                backgroundColor: const Color.fromRGBO(26, 188, 156, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(
                  Icons.restart_alt_rounded), // Add an icon to the button
            ),
          ],
        ),
      ),
    );
  }
}
