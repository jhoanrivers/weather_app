class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double speed;
  int deg;
  double gust;

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
    speed: json["speed"] == null ? null : json["speed"].toDouble(),
    deg: json["deg"] == null ? null : json["deg"],
    gust: json["gust"] == null ? null : json["gust"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "speed": speed == null ? null : speed,
    "deg": deg == null ? null : deg,
    "gust": gust == null ? null : gust,
  };
}