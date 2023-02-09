class Place {
  final String? id;
  final String name;
  final double latitude;
  final double longitude;

  Place({
    this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  Place copyWith({String? name, double? latitude, double? longitude}) {
    return Place(
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        id: json['id'],
        name: json['name'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
}
