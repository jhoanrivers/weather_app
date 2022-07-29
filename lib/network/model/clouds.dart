class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
    all: json["all"] == null ? null : json["all"],
  );

  Map<String, dynamic> toMap() => {
    "all": all == null ? null : all,
  };
}