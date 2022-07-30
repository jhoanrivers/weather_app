

import 'package:flutter/material.dart';
import 'package:weather_app/network/model/list_element.dart';

class DetailWeatherNotifier extends ChangeNotifier {

  late ListElement element;


  Future<void> initElement(ListElement element) async {
    this.element = element;
  }

}