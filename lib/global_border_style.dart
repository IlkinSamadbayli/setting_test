import 'package:flutter/material.dart';

class GlobalBorderStyle {
  static BorderRadius get borderRadius10 => BorderRadius.circular(10);
  static BorderRadius get borderRadius12 => BorderRadius.circular(12);
  static BorderRadius get borderRadius16 => BorderRadius.circular(16);
  static BorderRadius get borderRadius18 => BorderRadius.circular(18);
  static BorderRadius get borderRadius40 => BorderRadius.circular(40);
  static InputBorder get borderStyle => OutlineInputBorder(
        borderRadius: borderRadius16,
        borderSide: const BorderSide(
          color: Colors.blue,
        ),
      );

  static InputBorder get focusBorderStyle => OutlineInputBorder(
        borderRadius: borderRadius16,
        borderSide: const BorderSide(
          color: Colors.green,
        ),
      );
  static InputBorder get errorBorderStyle => OutlineInputBorder(
        borderRadius: borderRadius16,
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      );
  static InputBorder get enabledBorderStyle => OutlineInputBorder(
        borderRadius: borderRadius16,
        borderSide: const BorderSide(
          color: Colors.blue,
        ),
      );
}
