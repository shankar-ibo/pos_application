import 'package:flutter/material.dart';

ButtonStyle elevatedButtonStyle(
    {required ThemeData theme,
      required TextStyle? textStyle,
      required EdgeInsets padding,
      bool isEnabled = true,
     double elevation = 0}) {
  return ElevatedButton.styleFrom(
    backgroundColor: isEnabled? theme.colorScheme.secondary : Colors.grey,
    textStyle: textStyle?.copyWith(
      fontWeight: FontWeight.w500,
    ),
    padding: padding,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    elevation: elevation,
  );
}
