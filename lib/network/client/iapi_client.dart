

import '../model/weather.dart';

abstract class IApiClient {

  Future<Weather> getWeatherByLatLong(String latitude, String longitude);

  Future<Weather> getWeatherBy(String cityName);

}