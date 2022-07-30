

import 'package:weather_app/network/model/main_class.dart';
import 'package:weather_app/network/model/rain.dart';
import 'package:weather_app/network/model/sys.dart';
import 'package:weather_app/network/model/weather_element.dart';
import 'package:weather_app/network/model/wind.dart';

import 'clouds.dart';

class ListElement {

  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.sys,
    required this.dtTxt,
  });

  int dt;
  MainClass? main;
  List<WeatherElement>? weather;
  Clouds? clouds;
  Wind? wind;
  int visibility;
  double pop;
  Rain? rain;
  Sys? sys;
  DateTime? dtTxt;

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
    dt: json["dt"] == null ? null : json["dt"],
    main: json["main"] == null ? null : MainClass.fromMap(json["main"]),
    weather: json["weather"] == null ? null : List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromMap(x))),
    clouds: json["clouds"] == null ? null : Clouds.fromMap(json["clouds"]),
    wind: json["wind"] == null ? null : Wind.fromMap(json["wind"]),
    visibility: json["visibility"] == null ? null : json["visibility"],
    pop: json["pop"] == null ? null : json["pop"].toDouble(),
    rain: json["rain"] == null ? null : Rain.fromMap(json["rain"]),
    sys: json["sys"] == null ? null : Sys.fromMap(json["sys"]),
    dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
  );

  Map<String, dynamic> toMap() => {
    "dt": dt == null ? null : dt,
    "main": main == null ? null : main!.toMap(),
    "weather": weather == null ? null : List<dynamic>.from(weather!.map((x) => x.toMap())),
    "clouds": clouds == null ? null : clouds!.toMap(),
    "wind": wind == null ? null : wind!.toMap(),
    "visibility": visibility == null ? null : visibility,
    "pop": pop == null ? null : pop,
    "rain": rain == null ? null : rain!.toMap(),
    "sys": sys == null ? null : sys!.toMap(),
    "dt_txt": dtTxt == null ? null : dtTxt!.toIso8601String(),
  };
}