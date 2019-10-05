// To parse this JSON data, do
//
//     final addressPredicted = addressPredictedFromJson(jsonString);

import 'dart:convert';

AddressPredicted addressPredictedFromJson(String str) => AddressPredicted.fromJson(json.decode(str));

String addressPredictedToJson(AddressPredicted data) => json.encode(data.toJson());

class AddressPredicted {
  String status;
  List<Prediction> predictions;

  AddressPredicted({
    this.status,
    this.predictions,
  });

  factory AddressPredicted.fromJson(Map<String, dynamic> json) => AddressPredicted(
    status: json["status"],
    predictions: List<Prediction>.from(json["predictions"].map((x) => Prediction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "predictions": List<dynamic>.from(predictions.map((x) => x.toJson())),
  };
}

class Prediction {
  String description;
  int distanceMeters;
  String id;
  List<MatchedSubstring> matchedSubstrings;
  String placeId;
  String reference;
  List<Term> terms;
  List<String> types;

  Prediction({
    this.description,
    this.distanceMeters,
    this.id,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.terms,
    this.types,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
    description: json["description"],
    distanceMeters: json["distance_meters"],
    id: json["id"],
    matchedSubstrings: List<MatchedSubstring>.from(json["matched_substrings"].map((x) => MatchedSubstring.fromJson(x))),
    placeId: json["place_id"],
    reference: json["reference"],
    terms: List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
    types: List<String>.from(json["types"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "distance_meters": distanceMeters,
    "id": id,
    "matched_substrings": List<dynamic>.from(matchedSubstrings.map((x) => x.toJson())),
    "place_id": placeId,
    "reference": reference,
    "terms": List<dynamic>.from(terms.map((x) => x.toJson())),
    "types": List<dynamic>.from(types.map((x) => x)),
  };
}

class MatchedSubstring {
  int length;
  int offset;

  MatchedSubstring({
    this.length,
    this.offset,
  });

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) => MatchedSubstring(
    length: json["length"],
    offset: json["offset"],
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "offset": offset,
  };
}

class Term {
  int offset;
  String value;

  Term({
    this.offset,
    this.value,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
    offset: json["offset"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "value": value,
  };
}
