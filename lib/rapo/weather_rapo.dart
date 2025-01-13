import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_flutter_bloc/constant/api_endpoints.dart';
import 'package:weather_flutter_bloc/models/geo_data.dart';
import 'package:weather_flutter_bloc/models/weather_data.dart';

class WeatherRapo {
  static Future<GeoData> getGeoData(String city) async {
    String url = '$baseUrl/geo/1.0/direct?q=${city}&limit=1&appid=$apiKey';

    try {
      var res = await http.get(Uri.parse(url));
      GeoData geoData = GeoData.fromJson(jsonDecode(res.body));
      return geoData;
    } catch (e) {
      rethrow;
    }
  }

  static Future<WeatherData> getWeatherData(GeoData geoData) async {
    String url =
        '$baseUrl/data/2.5/weather?lat=${geoData.lat}&lon=${geoData.lon}&units=metric&appid=$apiKey';

    try {
      var res = await http.get(Uri.parse(url));
      WeatherData weatherData = WeatherData.fromJson(jsonDecode(res.body));
      return weatherData;
    } catch (e) {
      rethrow;
    }
  }

  static Future<WeatherData> apiCall(String city) async {
    try {
      final GeoData geoData = await getGeoData(city);
      final WeatherData weatherData = await getWeatherData(geoData);
      print(weatherData.toString());
      return weatherData;
    } catch (e) {
      rethrow;
    }
  }
}
