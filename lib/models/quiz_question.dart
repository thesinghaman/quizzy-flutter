class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  // Declare a final property 'text' that stores the question text.
  final String text;

  // Declare a final property 'answers' that stores a list of answer options.
  final List<String> answers;

  // Define a method called 'getShuffledAnswers' that returns a list of shuffled answers.
  List<String> getShuffledAnswers() {
    // Create a new list by copying the 'answers' list.
    final shuffledList = List.of(answers);
    // Shuffle the copied list to randomize the order of answers.
    shuffledList.shuffle();
    // Return the shuffled list of answers.
    return shuffledList;
  }
}
