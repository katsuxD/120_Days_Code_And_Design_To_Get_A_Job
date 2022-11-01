class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(dynamic json) {
    if (json == null) {
      return Clouds(all: json['all']);
    }

    return Clouds(
      all: json['all'],
    );
  }
}
