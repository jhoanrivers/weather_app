


import 'package:flutter/material.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/network/model/weather.dart';
import 'package:weather_app/network/repository/repository.dart';

import '../../../network/model/city.dart';
import '../../../network/model/list_element.dart';

class WeathersNotifier extends ChangeNotifier {

  var num = 0;
  bool loading = true;
  List<ListElement> listElement = const <ListElement>[];
  late City city;
  var lat = "-6.175115064391812";
  var lon = "106.82708842419382";

  Future<void> getWeatherByLatLong () async{
    Weather weather = await getIt.get<Repository>().getWeatherByLatLong(lat, lon);
    city = weather.city!;
    listElement = weather.list!;
    loading = false;
    notifyListeners();
  }


}