import 'package:flutter/material.dart';

class Alert {
  final Color color;
  final String message;
  final Color bgColor;
  const Alert({
    required this.color,
    required this.bgColor,
    required this.message,
  });
}

class SnackBarUtils {
  static Alert error(String message) {
    return Alert(
        color: const Color.fromARGB(255, 105, 10, 3),
        message: message,
        bgColor: const Color(0xFFFFDDDD));
  }

  static Alert success(String message) {
    return Alert(
      color: const Color.fromARGB(255, 20, 75, 24),
      message: message,
      bgColor: const Color(0xFFF5FDF6),
    );
  }
}
