import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './quiz.dart';

void main() {
  // Set the appearance of the system status bar (the top bar of the device)
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      // Make the status bar background transparent
      statusBarColor: Colors.transparent,
      // Set the status bar icons to be light (e.g., white) for better visibility
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // Run the app by executing the Quiz widget
  runApp(
    const Quiz(), // Run the Quiz widget as the main app
  );
}
