import 'package:flutter/material.dart';

void alertDailog(
  BuildContext context, {
  required String message,
  required VoidCallback onAgree,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Alert",
          style: TextTheme.of(context).headlineMedium!.copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              onAgree();
              Navigator.pop(context, false);
            },
            child: const Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text("No"),
          ),
        ],
      );
    },
  );
}
