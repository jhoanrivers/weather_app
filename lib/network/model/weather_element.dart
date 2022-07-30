

class WeatherElement {
  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory WeatherElement.fromMap(Map<String, dynamic> json) => WeatherElement(
    id: json["id"] == null ? null : json["id"],
    main: json["main"] == null ? null : json["main"],
    description: json["description"] == null ? null : json["description"],
    icon: json["icon"] == null ? null : json["icon"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

