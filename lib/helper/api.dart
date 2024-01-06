// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchDataFromApi(String apiUrl) async {
  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching data: $error');
  }
}
