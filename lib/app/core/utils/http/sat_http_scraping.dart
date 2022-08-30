import 'dart:developer';

import 'package:http/http.dart' as http;

class SatHttpScraping {
  static Future<String?> getData(String satUrl) async {
    try {
      final response = await http.get(Uri.parse(satUrl));
      if (response.statusCode == 200) return response.body;
    } catch (e) {
      log('SatHttpScraping $e');
    }
    return null;
  }
}
