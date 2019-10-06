// To parse this JSON data, do
//
//     final placesResult = placesResultFromJson(jsonString);

import 'dart:convert';

PlacesResult placesResultFromJson(String str) => PlacesResult.fromJson(json.decode(str));

String placesResultToJson(PlacesResult data) => json.encode(data.toJson());

class PlacesResult {
  List<dynamic> htmlAttributions;
  String nextPageToken;
  List<Result> results;

  PlacesResult({
    this.htmlAttributions,
    this.nextPageToken,
    this.results,
  });

  factory PlacesResult.fromJson(Map<String, dynamic> json) => PlacesResult(
    htmlAttributions: json["html_attributions"] == null ? null : List<dynamic>.from(json["html_attributions"].map((x) => x)),
    nextPageToken: json["next_page_token"] == null ? null : json["next_page_token"],
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "html_attributions": htmlAttributions == null ? null : List<dynamic>.from(htmlAttributions.map((x) => x)),
    "next_page_token": nextPageToken == null ? null : nextPageToken,
    "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
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
  int priceLevel;
  PlusCode plusCode;
  double rating;
  String reference;
  List<String> types;
  int userRatingsTotal;
  String vicinity;

  Result({
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.id,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.priceLevel,
    this.plusCode,
    this.rating,
    this.reference,
    this.types,
    this.userRatingsTotal,
    this.vicinity
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    formattedAddress: json["formatted_address"] == null ? null : json["formatted_address"],
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    icon: json["icon"] == null ? null : json["icon"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    openingHours: json["opening_hours"] == null ? null : OpeningHours.fromJson(json["opening_hours"]),
    photos: json["photos"] == null ? null : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    placeId: json["place_id"] == null ? null : json["place_id"],
    priceLevel: json["price_level"] == null ? null : json["price_level"],
    plusCode: json["plus_code"] == null ? null : PlusCode.fromJson(json["plus_code"]),
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    reference: json["reference"] == null ? null : json["reference"],
    types: json["types"] == null ? null : List<String>.from(json["types"].map((x) => x)),
    userRatingsTotal: json["user_ratings_total"] == null ? null : json["user_ratings_total"],
    vicinity: json["vicinity"] == null ? null : json["vicinity"],
  );

  Map<String, dynamic> toJson() => {
    "formatted_address": formattedAddress == null ? null : formattedAddress,
    "geometry": geometry == null ? null : geometry.toJson(),
    "icon": icon == null ? null : icon,
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "opening_hours": openingHours == null ? null : openingHours.toJson(),
    "photos": photos == null ? null : List<dynamic>.from(photos.map((x) => x.toJson())),
    "place_id": placeId == null ? null : placeId,
    "price_level": priceLevel == null ? null : priceLevel,
    "plus_code": plusCode == null ? null : plusCode.toJson(),
    "rating": rating == null ? null : rating,
    "reference": reference == null ? null : reference,
    "types": types == null ? null : List<dynamic>.from(types.map((x) => x)),
    "user_ratings_total": userRatingsTotal == null ? null : userRatingsTotal,
    "vicinity": vicinity == null ? null : vicinity,
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
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    viewport: json["viewport"] == null ? null : Viewport.fromJson(json["viewport"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location == null ? null : location.toJson(),
    "viewport": viewport == null ? null : viewport.toJson(),
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
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lng: json["lng"] == null ? null : json["lng"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
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
    northeast: json["northeast"] == null ? null : Location.fromJson(json["northeast"]),
    southwest: json["southwest"] == null ? null : Location.fromJson(json["southwest"]),
  );

  Map<String, dynamic> toJson() => {
    "northeast": northeast == null ? null : northeast.toJson(),
    "southwest": southwest == null ? null : southwest.toJson(),
  };
}

class OpeningHours {
  bool openNow;

  OpeningHours({
    this.openNow,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
    openNow: json["open_now"] == null ? null : json["open_now"],
  );

  Map<String, dynamic> toJson() => {
    "open_now": openNow == null ? null : openNow,
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
    height: json["height"] == null ? null : json["height"],
    htmlAttributions: json["html_attributions"] == null ? null : List<String>.from(json["html_attributions"].map((x) => x)),
    photoReference: json["photo_reference"] == null ? null : json["photo_reference"],
    width: json["width"] == null ? null : json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height == null ? null : height,
    "html_attributions": htmlAttributions == null ? null : List<dynamic>.from(htmlAttributions.map((x) => x)),
    "photo_reference": photoReference == null ? null : photoReference,
    "width": width == null ? null : width,
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
    compoundCode: json["compound_code"] == null ? null : json["compound_code"],
    globalCode: json["global_code"] == null ? null : json["global_code"],
  );

  Map<String, dynamic> toJson() => {
    "compound_code": compoundCode == null ? null : compoundCode,
    "global_code": globalCode == null ? null : globalCode,
  };
}
