

import 'package:flutter/material.dart';
import 'package:weather_app/network/model/list_element.dart';
import 'package:weather_app/util/base_sized.dart';
import 'package:weather_app/util/base_style.dart';
import 'package:weather_app/util/util_service.dart';

class WeatherItem extends StatelessWidget {

  final ListElement element;

  const WeatherItem({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              "http://openweathermap.org/img/wn/${element.weather![0].icon}@2x.png",
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(UtilService.convertDateTimetoString(element.dtTxt!),
              style: BaseStyle.ts14Bold(),),
              BaseSized.h6(),
              Text(element.weather![0].main),
              BaseSized.h6(),
              Text("${(element.main!.temp - 273.15).toStringAsFixed(2)}°C")
            ],
          )
        ],
      ),
    );
  }
}
