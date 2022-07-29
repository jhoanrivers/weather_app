// To parse this JSON data, do
//
//     final weather = weatherFromMap(jsonString);

import 'dart:convert';

import 'city.dart';
import 'enum_description.dart';
import 'enum_pod.dart';
import 'enum_values.dart';
import 'list_element.dart';

Weather weatherFromMap(String str) => Weather.fromMap(json.decode(str));

String weatherToMap(Weather data) => json.encode(data.toMap());

class Weather {
  Weather({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  String? cod;
  int? message;
  int? cnt;
  List<ListElement>? list;
  City? city;

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        cod: json["cod"] == null ? null : json["cod"],
        message: json["message"] == null ? null : json["message"],
        cnt: json["cnt"] == null ? null : json["cnt"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromMap(x))),
        city: json["city"] == null ? null : City.fromMap(json["city"]),
      );

  Map<String, dynamic> toMap() => {
        "cod": cod == null ? null : cod,
        "message": message == null ? null : message,
        "cnt": cnt == null ? null : cnt,
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toMap())),
        "city": city == null ? null : city!.toMap(),
      };

}

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});
