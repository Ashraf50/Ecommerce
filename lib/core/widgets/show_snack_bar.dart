import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      action: SnackBarAction(
        label: "Dismiss",
        onPressed: () {},
      ),
    ),
  );
}
