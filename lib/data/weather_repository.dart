import 'dart:convert';

import 'package:http/http.dart' as http;

class weatherRepository {
  Future<double> fetchTemp(String city) async {
    final apiKey = "95f4dba898f64f2894084432242710";
    final url =
        "https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final temp = data['current']['temp_c'] as double;
      return temp;
    } else {
      throw Exception('failed to fetch weather');
    }
  }
}
