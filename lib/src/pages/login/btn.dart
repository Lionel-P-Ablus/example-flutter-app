import 'package:flutter/material.dart';

class Btn {
  final String text;
  final VoidCallback onPressed;

  const Btn({
    this.text,
    this.onPressed,
  });

  // { param } meaning param not required
  Container _buildTextButton(String text, {VoidCallback onPressed}) {
    return Container(
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white70),
        ),
        onPressed: onPressed,
      ),
    );
  }

  final btnBuildTextButton = (String text, {VoidCallback onPressed}) =>
      _buildTextButton(text, onPressed: onPressed);
}
