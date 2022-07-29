


import 'package:weather_app/network/model/weather.dart';

abstract class IRepository {

  Future<Weather> getWeatherByLatLong(String latitude, String longitude);


}