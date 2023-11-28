import 'package:flutter/material.dart';

class TextAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Recipedia is an application that provides a list of food recipes. In this application, '
              'you can add, edit, and delete your own food recipes.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54, // Adjust color to match your theme
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 80),
        Text(
          'Designed by:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          '1. Nathanael Nelson (825210013)',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          '2. Julio Lim (825210020)',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          '3. Geoffrey Valhart (825210040)',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          '4. Andy Wijaya (825210077)',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
