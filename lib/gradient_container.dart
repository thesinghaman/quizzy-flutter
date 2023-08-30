import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    // Specify the required parameters for the constructor.
    required this.color1,
    required this.color2,
    required this.child, // Accept a child widget as an argument
    Key? key,
  }) : super(key: key);

  // Declare final properties to store the gradient colors and the child widget.
  final Color color1;
  final Color color2;
  final Widget child; // Declare the child widget

  // Build method: This method defines how the widget should be displayed.
  @override
  Widget build(BuildContext context) {
    return Container(
      // Apply a decoration to the container.
      decoration: BoxDecoration(
        // Create a gradient using LinearGradient.
        gradient: LinearGradient(
          // Specify the colors for the gradient.
          colors: [color1, color2],
          // Specify the starting point of the gradient.
          begin: Alignment.topLeft,
          // Specify the ending point of the gradient.
          end: Alignment.bottomRight,
        ),
      ),
      // Create a SafeArea widget to ensure content stays within the visible area.
      child: SafeArea(
        // Center the child widget within the safe area.
        child: Center(
          // Display the child widget that was passed as an argument.
          child: child,
        ),
      ),
    );
  }
}
