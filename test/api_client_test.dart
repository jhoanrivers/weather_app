


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:weather_app/network/client/iapi_client.dart';
import 'package:weather_app/network/model/weather.dart';

class ApiClientTest extends IApiClient {


  @override
  Future<Weather> getWeatherBy(String cityName) {
    // TODO: implement getWeatherBy
    throw UnimplementedError();
  }

  @override
  Future<Weather> getWeatherByLatLong(String latitude, String longitude) async{

   try {
     var response = {
       "cod": "200",
       "message": 0,
       "cnt": 40,
       "list": [
         {
           "dt": 1659150000,
           "main": {
             "temp": 301.14,
             "feels_like": 304.48,
             "temp_min": 301.14,
             "temp_max": 302.67,
             "pressure": 1010,
             "sea_level": 1010,
             "grnd_level": 1010,
             "humidity": 75,
             "temp_kf": -1.53
           },
           "weather": [
             {
               "id": 802,
               "main": "Clouds",
               "description": "scattered clouds",
               "icon": "03d"
             }
           ],
           "clouds": {
             "all": 40
           },
           "wind": {
             "speed": 0.96,
             "deg": 99,
             "gust": 1.32
           },
           "visibility": 10000,
           "pop": 0,
           "sys": {
             "pod": "d"
           },
           "dt_txt": "2022-07-30 03:00:00"
         },
       ],
       "city": {
         "id": 1631845,
         "name": "Pecenongan",
         "coord": {
           "lat": -6.1751,
           "lon": 106.8271
         },
         "country": "ID",
         "population": 0,
         "timezone": 25200,
         "sunrise": 1659135832,
         "sunset": 1659178453
       }
     };
     Weather weather = Weather.fromMap(response);
     return weather;

   } catch(e) {
     throw StateError(e.toString());
   }
  }


}