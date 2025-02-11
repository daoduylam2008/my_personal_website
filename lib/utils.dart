import 'dart:convert';

import 'package:flutter/services.dart';

String? capitalizeString(String text) {
  if (text.isNotEmpty) {
    return text[0].toUpperCase() + text.substring(1);
  }
  return null;
}

Future<Map<String, dynamic>> readFile(String path) async {
  final String response = await rootBundle.loadString(path);
  return jsonDecode(response);
}
