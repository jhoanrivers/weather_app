
class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });

  double lat;
  double lon;

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lon: json["lon"] == null ? null : json["lon"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "lat": lat == null ? null : lat,
    "lon": lon == null ? null : lon,
  };
}
