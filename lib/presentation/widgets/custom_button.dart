import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width; // Add width parameter
  final Color color; // Add color parameter
  final Color textColor; // Add textColor parameter

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.width, // Initialize width parameter
    this.color = Colors.blue, // Default to a color if not specified
    this.textColor = Colors.white, // Default to a color if not specified
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Apply width if provided
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color), // Set button background color
          foregroundColor: MaterialStateProperty.all<Color>(textColor), // Set text color
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 50, vertical: 17),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
