import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/network/client/iapi_client.dart';
import 'package:weather_app/network/model/weather.dart';

class ApiClient implements IApiClient {
  var baseUrl = "http://api.openweathermap.org/data/2.5/forecast";
  var apiKey = "d86123fb06c3d15f8328995c131d7c47";

  @override
  Future<Weather> getWeatherBy(String cityName) {
    throw UnimplementedError();
  }

  @override
  Future<Weather> getWeatherByLatLong(
      String latitude, String longitude) async {
    var url = "$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey";
    try {
      var response = await http.get(
        Uri.parse(url),
      );
      Map<String,dynamic> responseDecode = json.decode(response.body);
      Weather weather = Weather.fromMap(responseDecode);
      return weather;
    } catch (e) {
      throw StateError(e.toString());
    }
  }
}
