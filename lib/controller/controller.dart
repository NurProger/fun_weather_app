import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather_app_api_openweather/model/main_model.dart';
import 'consts.dart';

Future<MainWeather> getData(String city) async {
  try {
    final dio = Dio();
    final api = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey";
    final response = await dio.get(api);

    if (response.statusCode == 200) {
      final data = MainWeather.fromJson(response.data);
      return data;
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to fetch data: $e");
  }
}

