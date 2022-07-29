
import 'coord.dart';

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  int id;
  String name;
  Coord? coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  factory City.fromMap(Map<String, dynamic> json) => City(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    coord: json["coord"] == null ? null : Coord.fromMap(json["coord"]),
    country: json["country"] == null ? null : json["country"],
    population: json["population"] == null ? null : json["population"],
    timezone: json["timezone"] == null ? null : json["timezone"],
    sunrise: json["sunrise"] == null ? null : json["sunrise"],
    sunset: json["sunset"] == null ? null : json["sunset"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "coord": coord == null ? null : coord!.toMap(),
    "country": country == null ? null : country,
    "population": population == null ? null : population,
    "timezone": timezone == null ? null : timezone,
    "sunrise": sunrise == null ? null : sunrise,
    "sunset": sunset == null ? null : sunset,
  };
}