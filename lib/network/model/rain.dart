
class Rain {
  Rain({
    required this.the3H,
  });

  double the3H;

  factory Rain.fromMap(Map<String, dynamic> json) => Rain(
    the3H: json["3h"] == null ? null : json["3h"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "3h": the3H == null ? null : the3H,
  };
}