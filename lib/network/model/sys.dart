import 'package:weather_app/network/model/weather.dart';

import 'enum_pod.dart';

class Sys {
  Sys({
    required this.pod,
  });

  Pod? pod;

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
    pod: json["pod"] == null ? null : podValues.map[json["pod"]],
  );

  Map<String, dynamic> toMap() => {
    "pod": pod == null ? null : podValues.reverse[pod],
  };
}