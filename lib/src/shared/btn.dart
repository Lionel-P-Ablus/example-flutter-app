import 'package:flutter/material.dart';

class Btn {
  const Btn();

  // { param } meaning param not required
  Container buildTextButton(String text, {VoidCallback onPressed}) {
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
}
