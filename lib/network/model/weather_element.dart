import 'package:weather_app/network/model/weather.dart';

import 'enum_description.dart';

class WeatherElement {
  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  MainEnum? main;
  Description? description;
  Icon? icon;

  factory WeatherElement.fromMap(Map<String, dynamic> json) => WeatherElement(
    id: json["id"] == null ? null : json["id"],
    main: json["main"] == null ? null : mainEnumValues.map[json["main"]],
    description: json["description"] == null ? null : descriptionValues.map[json["description"]],
    icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "main": main == null ? null : mainEnumValues.reverse[main],
    "description": description == null ? null : descriptionValues.reverse[description],
    "icon": icon == null ? null : iconValues.reverse[icon],
  };
}

