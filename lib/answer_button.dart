import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  // Declare a final property 'answerText' that stores the text for the answer.
  final String answerText;

  // Declare a final property 'onTap' that stores the function to be executed
  // when the button is pressed.
  final void Function() onTap;

  // Build method: This method defines how the widget should be displayed.
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        // Define the border of the button using MaterialStateProperty.
        side: MaterialStateProperty.all<BorderSide>(
          // Specify the color of the border.
          const BorderSide(
            color: Color.fromRGBO(166, 172, 175, 1),
          ),
        ),
        // Define the shape of the button using MaterialStateProperty.
        shape: MaterialStateProperty.all<OutlinedBorder>(
          // Create a rounded rectangle shape with a specified corner radius.
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        // Display the answer text using the Text widget.
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 18),
          // Center the text within the button.
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
