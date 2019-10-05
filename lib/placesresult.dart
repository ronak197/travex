// To parse this JSON data, do
//
//     final placesresult = placesresultFromJson(jsonString);

import 'dart:convert';

Placesresult placesresultFromJson(String str) => Placesresult.fromJson(json.decode(str));

String placesresultToJson(Placesresult data) => json.encode(data.toJson());

class Placesresult {
  String htmlAttributions;
  String nextPageToken;
  List<Result> results;

  Placesresult({
    this.htmlAttributions,
    this.nextPageToken,
    this.results,
  });

  factory Placesresult.fromJson(Map<String, dynamic> json) => Placesresult(
    htmlAttributions: json["html_attributions"],
    nextPageToken: json["next_page_token"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "html_attributions": htmlAttributions,
    "next_page_token": nextPageToken,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  String formattedAddress;
  Geometry geometry;
  String icon;
  String id;
  String name;
  OpeningHours openingHours;
  List<Photo> photos;
  String placeId;
  PlusCode plusCode;
  double rating;
  String reference;
  List<String> types;
  int userRatingsTotal;

  Result({
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.id,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.types,
    this.userRatingsTotal,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    formattedAddress: json["formatted_address"],
    geometry: Geometry.fromJson(json["geometry"]),
    icon: json["icon"],
    id: json["id"],
    name: json["name"],
    openingHours: OpeningHours.fromJson(json["opening_hours"]),
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    placeId: json["place_id"],
    plusCode: PlusCode.fromJson(json["plus_code"]),
    rating: json["rating"].toDouble(),
    reference: json["reference"],
    types: List<String>.from(json["types"].map((x) => x)),
    userRatingsTotal: json["user_ratings_total"],
  );

  Map<String, dynamic> toJson() => {
    "formatted_address": formattedAddress,
    "geometry": geometry.toJson(),
    "icon": icon,
    "id": id,
    "name": name,
    "opening_hours": openingHours.toJson(),
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "place_id": placeId,
    "plus_code": plusCode.toJson(),
    "rating": rating,
    "reference": reference,
    "types": List<dynamic>.from(types.map((x) => x)),
    "user_ratings_total": userRatingsTotal,
  };
}

class Geometry {
  Location location;
  Viewport viewport;

  Geometry({
    this.location,
    this.viewport,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    location: Location.fromJson(json["location"]),
    viewport: Viewport.fromJson(json["viewport"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "viewport": viewport.toJson(),
  };
}

class Location {
  double lat;
  double lng;

  Location({
    this.lat,
    this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Viewport {
  Location northeast;
  Location southwest;

  Viewport({
    this.northeast,
    this.southwest,
  });

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
    northeast: Location.fromJson(json["northeast"]),
    southwest: Location.fromJson(json["southwest"]),
  );

  Map<String, dynamic> toJson() => {
    "northeast": northeast.toJson(),
    "southwest": southwest.toJson(),
  };
}

class OpeningHours {
  bool openNow;

  OpeningHours({
    this.openNow,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
    openNow: json["open_now"],
  );

  Map<String, dynamic> toJson() => {
    "open_now": openNow,
  };
}

class Photo {
  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    height: json["height"],
    htmlAttributions: List<String>.from(json["html_attributions"].map((x) => x)),
    photoReference: json["photo_reference"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "html_attributions": List<dynamic>.from(htmlAttributions.map((x) => x)),
    "photo_reference": photoReference,
    "width": width,
  };
}

class PlusCode {
  String compoundCode;
  String globalCode;

  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
    compoundCode: json["compound_code"],
    globalCode: json["global_code"],
  );

  Map<String, dynamic> toJson() => {
    "compound_code": compoundCode,
    "global_code": globalCode,
  };
}