import 'package:flutter/material.dart';

void messageSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, maxLines: 2),
      duration: Duration(seconds: 2),
    ),
  );
}
