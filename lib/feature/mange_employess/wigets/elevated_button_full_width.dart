import 'package:flutter/material.dart';

Widget fullWidthButton(
  BuildContext context, {
  required String text,
  VoidCallback? onTap,
}) {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed:
              onTap ??
              () {
                debugPrint("not on Tap");
              },
          child: Text(text, style: TextTheme.of(context).labelLarge),
        ),
      ),
    ],
  );
}
