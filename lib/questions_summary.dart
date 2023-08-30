import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  // Declare a final property 'summaryData' that stores a list of summary data.
  final List<Map<String, Object>> summaryData;

  // Build method: This method defines how the widget should be displayed.
  @override
  Widget build(BuildContext context) {
    // Create a SizedBox widget with a specific height.
    return SizedBox(
      height: 450,
      child: Container(
        // Apply a decoration to the container for styling.
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        padding: const EdgeInsets.all(
            20), // Apply padding to the container's content
        child: SingleChildScrollView(
          // Create a SingleChildScrollView to make the content scrollable.
          child: Column(
            // Create a column to organize widgets vertically.
            children: summaryData.map(
              (data) {
                // Use the map function to create a list of widgets based on the 'summaryData'.
                // 'data' represents each item in 'summaryData'.
                final isCorrectAnswer =
                    data['user_answer'] == data['correct_answer'];
                // Check if the user's answer is correct.

                // Create a Row to display data for each question.
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Create a container to display the question index with a background color.
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isCorrectAnswer
                            ? const Color.fromARGB(255, 150, 198, 241)
                            : const Color.fromARGB(255, 249, 133, 241),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // Display the question index.
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 22, 2, 56),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // Add horizontal space

                    // Create an Expanded widget to fill available horizontal space.
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display the question text with specific style.
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              color: Color.fromRGBO(166, 172, 175, 1),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5), // Add vertical space

                          // Display the user's answer with specific style.
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 202, 171, 252),
                            ),
                          ),

                          // Display the correct answer with specific style.
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 181, 254, 246),
                            ),
                          ),

                          const SizedBox(height: 20), // Add vertical space
                        ],
                      ),
                    ),
                  ],
                );
              },
            ).toList(), // Convert the mapped widgets to a list.
          ),
        ),
      ),
    );
  }
}
