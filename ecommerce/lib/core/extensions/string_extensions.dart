import 'dart:convert';

import 'package:flutter/material.dart';

extension Stringx on String {
  String get emoji => _emojiDecoder(this);
}

extension Colorx on String {
  Color get color => _toColor(this);
}

String _emojiDecoder(String text) {
  String data = '';
  try {
    List<int> bytes = text.codeUnits;
    data = utf8.decode(bytes);
  } catch (e) {
    data = text;
  }
  return data;
}

Color _toColor(String colorValue) {
    // Remove # if present
    String hex = colorValue.replaceAll('#', '');
    
    // Validate hex string length
    if (hex.length != 6 && hex.length != 8) {
      throw ArgumentError('Invalid hex color: $hex. Must be 6 or 8 characters long.');
    }
    
    // Parse the hex string to integer
    if (hex.length == 6) {
      // If 6 characters, add full opacity (FF)
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }