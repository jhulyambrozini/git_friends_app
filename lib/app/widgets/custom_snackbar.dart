import 'package:flutter/material.dart';
import 'package:git_friend/shared/utils/snackbar_utils.dart';

class CustomSnackBar {
  final BuildContext context;
  final Duration duration;
  final double? fontSize;
  final EdgeInsetsGeometry padding;

  const CustomSnackBar(
    this.context, {
    this.duration = const Duration(seconds: 2, milliseconds: 500),
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    this.fontSize = 16,
  });

  void show(Alert notification) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        backgroundColor: notification.bgColor,
        content: Text(
          notification.message,
          style: TextStyle(
            color: notification.color,
            fontSize: fontSize,
            fontFamily: 'Poppins',
          ),
        ),
        duration: duration,
        padding: padding,
      ),
    );
  }
}
