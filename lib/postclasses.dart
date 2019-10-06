import 'dart:convert';

LocationPostParams locationPostParamsFromJson(String str) {
  final jsonData = json.decode(str);
  return LocationPostParams.fromJson(jsonData);
}

String locationPostParamsToJson(LocationPostParams data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class LocationPostParams {
  List<double> lat;
  List<double> lng;

  LocationPostParams({
    this.lat,
    this.lng,
  });

  factory LocationPostParams.fromJson(Map<String, dynamic> json) => LocationPostParams(
    lat: json["lat"] == null ? null : List<double>.from(json["lat"].map((x) => x)),
    lng: json["lng"] == null ? null : List<double>.from(json["lng"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat == null ? null : List<dynamic>.from(lat.map((x) => x)),
    "lng": lng == null ? null : List<dynamic>.from(lng.map((x) => x)),
  };
}