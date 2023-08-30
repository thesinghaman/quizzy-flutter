import 'package:flutter/material.dart';

import './questions_screen.dart';
import './gradient_container.dart';
import './start_screen.dart';
import '/data/questions.dart';
import './results_screen.dart';

// Create the Quiz class which extends StatefulWidget
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  // Create the state for the Quiz class
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// Define the state for the Quiz class
class _QuizState extends State<Quiz> {
  // Initialize a list to store selected answers
  List<String> selectedAnswers = [];

  // Initialize a variable to track the active screen
  var activeScreen = 'start-screen';

  // Function to switch the active screen to the questions screen
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // This function is executed when the restart button is pressed on Results Screen.
  // This function is passed as an argument to results_screen.
  void restart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  // Function to handle selecting an answer
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer); // Add the selected answer to the list

    // Check if all questions are answered
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen'; // Switch to the results screen
      });
    }
  }

  // Build method for the widget
  @override
  Widget build(context) {
    // Start with the StartScreen widget as the default
    Widget screenWidget = StartScreen(switchScreen);

    // If active screen is 'questions-screen', switch to QuestionsScreen
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    // If active screen is 'results-screen', switch to ResultsScreen
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restart,
      );
    }

    // Build and return the MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Use GradientContainer with specified colors
        body: GradientContainer(
          color1: const Color.fromRGBO(35, 37, 38, 1),
          color2: const Color.fromRGBO(65, 67, 69, 1),
          child: screenWidget, // Display the active screen
        ),
      ),
    );
  }
}
