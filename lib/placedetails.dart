// To parse this JSON data, do
//
//     final placeDetails = placeDetailsFromJson(jsonString);

import 'dart:convert';

PlaceDetails placeDetailsFromJson(String str) => PlaceDetails.fromJson(json.decode(str));

String placeDetailsToJson(PlaceDetails data) => json.encode(data.toJson());

class PlaceDetails {
  List<dynamic> htmlAttributions;
  PlaceDetailsResult result;
  String status;

  PlaceDetails({
    this.htmlAttributions,
    this.result,
    this.status,
  });

  factory PlaceDetails.fromJson(Map<String, dynamic> json) => PlaceDetails(
    htmlAttributions: json["html_attributions"] == null ? null : List<dynamic>.from(json["html_attributions"].map((x) => x)),
    result: json["result"] == null ? null : PlaceDetailsResult.fromJson(json["result"]),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "html_attributions": htmlAttributions == null ? null : List<dynamic>.from(htmlAttributions.map((x) => x)),
    "result": result == null ? null : result.toJson(),
    "status": status == null ? null : status,
  };
}

class PlaceDetailsResult {
  List<PlaceDetailsAddressComponent> addressComponents;
  String adrAddress;
  String formattedAddress;
  String formattedPhoneNumber;
  PlaceDetailsGeometry geometry;
  String icon;
  String id;
  String internationalPhoneNumber;
  String name;
  PlaceDetailsOpeningHours openingHours;
  List<PlaceDetailsPhoto> photos;
  String placeId;
  PlaceDetailsPlusCode plusCode;
  double rating;
  String reference;
  List<PlaceDetailsReview> reviews;
  String scope;
  List<String> types;
  String url;
  int userRatingsTotal;
  int utcOffset;
  String vicinity;
  String website;

  PlaceDetailsResult({
    this.addressComponents,
    this.adrAddress,
    this.formattedAddress,
    this.formattedPhoneNumber,
    this.geometry,
    this.icon,
    this.id,
    this.internationalPhoneNumber,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.reviews,
    this.scope,
    this.types,
    this.url,
    this.userRatingsTotal,
    this.utcOffset,
    this.vicinity,
    this.website,
  });

  factory PlaceDetailsResult.fromJson(Map<String, dynamic> json) => PlaceDetailsResult(
    addressComponents: json["address_components"] == null ? null : List<PlaceDetailsAddressComponent>.from(json["address_components"].map((x) => PlaceDetailsAddressComponent.fromJson(x))),
    adrAddress: json["adr_address"] == null ? null : json["adr_address"],
    formattedAddress: json["formatted_address"] == null ? null : json["formatted_address"],
    formattedPhoneNumber: json["formatted_phone_number"] == null ? null : json["formatted_phone_number"],
    geometry: json["geometry"] == null ? null : PlaceDetailsGeometry.fromJson(json["geometry"]),
    icon: json["icon"] == null ? null : json["icon"],
    id: json["id"] == null ? null : json["id"],
    internationalPhoneNumber: json["international_phone_number"] == null ? null : json["international_phone_number"],
    name: json["name"] == null ? null : json["name"],
    openingHours: json["opening_hours"] == null ? null : PlaceDetailsOpeningHours.fromJson(json["opening_hours"]),
    photos: json["photos"] == null ? null : List<PlaceDetailsPhoto>.from(json["photos"].map((x) => PlaceDetailsPhoto.fromJson(x))),
    placeId: json["place_id"] == null ? null : json["place_id"],
    plusCode: json["plus_code"] == null ? null : PlaceDetailsPlusCode.fromJson(json["plus_code"]),
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    reference: json["reference"] == null ? null : json["reference"],
    reviews: json["reviews"] == null ? null : List<PlaceDetailsReview>.from(json["reviews"].map((x) => PlaceDetailsReview.fromJson(x))),
    scope: json["scope"] == null ? null : json["scope"],
    types: json["types"] == null ? null : List<String>.from(json["types"].map((x) => x)),
    url: json["url"] == null ? null : json["url"],
    userRatingsTotal: json["user_ratings_total"] == null ? null : json["user_ratings_total"],
    utcOffset: json["utc_offset"] == null ? null : json["utc_offset"],
    vicinity: json["vicinity"] == null ? null : json["vicinity"],
    website: json["website"] == null ? null : json["website"],
  );

  Map<String, dynamic> toJson() => {
    "address_components": addressComponents == null ? null : List<dynamic>.from(addressComponents.map((x) => x.toJson())),
    "adr_address": adrAddress == null ? null : adrAddress,
    "formatted_address": formattedAddress == null ? null : formattedAddress,
    "formatted_phone_number": formattedPhoneNumber == null ? null : formattedPhoneNumber,
    "geometry": geometry == null ? null : geometry.toJson(),
    "icon": icon == null ? null : icon,
    "id": id == null ? null : id,
    "international_phone_number": internationalPhoneNumber == null ? null : internationalPhoneNumber,
    "name": name == null ? null : name,
    "opening_hours": openingHours == null ? null : openingHours.toJson(),
    "photos": photos == null ? null : List<dynamic>.from(photos.map((x) => x.toJson())),
    "place_id": placeId == null ? null : placeId,
    "plus_code": plusCode == null ? null : plusCode.toJson(),
    "rating": rating == null ? null : rating,
    "reference": reference == null ? null : reference,
    "reviews": reviews == null ? null : List<dynamic>.from(reviews.map((x) => x.toJson())),
    "scope": scope == null ? null : scope,
    "types": types == null ? null : List<dynamic>.from(types.map((x) => x)),
    "url": url == null ? null : url,
    "user_ratings_total": userRatingsTotal == null ? null : userRatingsTotal,
    "utc_offset": utcOffset == null ? null : utcOffset,
    "vicinity": vicinity == null ? null : vicinity,
    "website": website == null ? null : website,
  };
}

class PlaceDetailsAddressComponent {
  String longName;
  String shortName;
  List<String> types;

  PlaceDetailsAddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  factory PlaceDetailsAddressComponent.fromJson(Map<String, dynamic> json) => PlaceDetailsAddressComponent(
    longName: json["long_name"] == null ? null : json["long_name"],
    shortName: json["short_name"] == null ? null : json["short_name"],
    types: json["types"] == null ? null : List<String>.from(json["types"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "long_name": longName == null ? null : longName,
    "short_name": shortName == null ? null : shortName,
    "types": types == null ? null : List<dynamic>.from(types.map((x) => x)),
  };
}

class PlaceDetailsGeometry {
  PlaceDetailsLocation location;
  PlaceDetailsViewport viewport;

  PlaceDetailsGeometry({
    this.location,
    this.viewport,
  });

  factory PlaceDetailsGeometry.fromJson(Map<String, dynamic> json) => PlaceDetailsGeometry(
    location: json["location"] == null ? null : PlaceDetailsLocation.fromJson(json["location"]),
    viewport: json["viewport"] == null ? null : PlaceDetailsViewport.fromJson(json["viewport"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location == null ? null : location.toJson(),
    "viewport": viewport == null ? null : viewport.toJson(),
  };
}

class PlaceDetailsLocation {
  double lat;
  double lng;

  PlaceDetailsLocation({
    this.lat,
    this.lng,
  });

  factory PlaceDetailsLocation.fromJson(Map<String, dynamic> json) => PlaceDetailsLocation(
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lng: json["lng"] == null ? null : json["lng"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
  };
}

class PlaceDetailsViewport {
  PlaceDetailsLocation northeast;
  PlaceDetailsLocation southwest;

  PlaceDetailsViewport({
    this.northeast,
    this.southwest,
  });

  factory PlaceDetailsViewport.fromJson(Map<String, dynamic> json) => PlaceDetailsViewport(
    northeast: json["northeast"] == null ? null : PlaceDetailsLocation.fromJson(json["northeast"]),
    southwest: json["southwest"] == null ? null : PlaceDetailsLocation.fromJson(json["southwest"]),
  );

  Map<String, dynamic> toJson() => {
    "northeast": northeast == null ? null : northeast.toJson(),
    "southwest": southwest == null ? null : southwest.toJson(),
  };
}

class PlaceDetailsOpeningHours {
  bool openNow;
  List<PlaceDetailsPeriod> periods;
  List<String> weekdayText;

  PlaceDetailsOpeningHours({
    this.openNow,
    this.periods,
    this.weekdayText,
  });

  factory PlaceDetailsOpeningHours.fromJson(Map<String, dynamic> json) => PlaceDetailsOpeningHours(
    openNow: json["open_now"] == null ? null : json["open_now"],
    periods: json["periods"] == null ? null : List<PlaceDetailsPeriod>.from(json["periods"].map((x) => PlaceDetailsPeriod.fromJson(x))),
    weekdayText: json["weekday_text"] == null ? null : List<String>.from(json["weekday_text"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "open_now": openNow == null ? null : openNow,
    "periods": periods == null ? null : List<dynamic>.from(periods.map((x) => x.toJson())),
    "weekday_text": weekdayText == null ? null : List<dynamic>.from(weekdayText.map((x) => x)),
  };
}

class PlaceDetailsPeriod {
  PlaceDetailsClose close;
  PlaceDetailsClose open;

  PlaceDetailsPeriod({
    this.close,
    this.open,
  });

  factory PlaceDetailsPeriod.fromJson(Map<String, dynamic> json) => PlaceDetailsPeriod(
    close: json["close"] == null ? null : PlaceDetailsClose.fromJson(json["close"]),
    open: json["open"] == null ? null : PlaceDetailsClose.fromJson(json["open"]),
  );

  Map<String, dynamic> toJson() => {
    "close": close == null ? null : close.toJson(),
    "open": open == null ? null : open.toJson(),
  };
}

class PlaceDetailsClose {
  int day;
  String time;

  PlaceDetailsClose({
    this.day,
    this.time,
  });

  factory PlaceDetailsClose.fromJson(Map<String, dynamic> json) => PlaceDetailsClose(
    day: json["day"] == null ? null : json["day"],
    time: json["time"] == null ? null : json["time"],
  );

  Map<String, dynamic> toJson() => {
    "day": day == null ? null : day,
    "time": time == null ? null : time,
  };
}

class PlaceDetailsPhoto {
  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  PlaceDetailsPhoto({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  factory PlaceDetailsPhoto.fromJson(Map<String, dynamic> json) => PlaceDetailsPhoto(
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

class PlaceDetailsPlusCode {
  String compoundCode;
  String globalCode;

  PlaceDetailsPlusCode({
    this.compoundCode,
    this.globalCode,
  });

  factory PlaceDetailsPlusCode.fromJson(Map<String, dynamic> json) => PlaceDetailsPlusCode(
    compoundCode: json["compound_code"] == null ? null : json["compound_code"],
    globalCode: json["global_code"] == null ? null : json["global_code"],
  );

  Map<String, dynamic> toJson() => {
    "compound_code": compoundCode == null ? null : compoundCode,
    "global_code": globalCode == null ? null : globalCode,
  };
}

class PlaceDetailsReview {
  String authorName;
  String authorUrl;
  String language;
  String profilePhotoUrl;
  int rating;
  String relativeTimeDescription;
  String text;
  int time;

  PlaceDetailsReview({
    this.authorName,
    this.authorUrl,
    this.language,
    this.profilePhotoUrl,
    this.rating,
    this.relativeTimeDescription,
    this.text,
    this.time,
  });

  factory PlaceDetailsReview.fromJson(Map<String, dynamic> json) => PlaceDetailsReview(
    authorName: json["author_name"] == null ? null : json["author_name"],
    authorUrl: json["author_url"] == null ? null : json["author_url"],
    language: json["language"] == null ? null : json["language"],
    profilePhotoUrl: json["profile_photo_url"] == null ? null : json["profile_photo_url"],
    rating: json["rating"] == null ? null : json["rating"],
    relativeTimeDescription: json["relative_time_description"] == null ? null : json["relative_time_description"],
    text: json["text"] == null ? null : json["text"],
    time: json["time"] == null ? null : json["time"],
  );

  Map<String, dynamic> toJson() => {
    "author_name": authorName == null ? null : authorName,
    "author_url": authorUrl == null ? null : authorUrl,
    "language": language == null ? null : language,
    "profile_photo_url": profilePhotoUrl == null ? null : profilePhotoUrl,
    "rating": rating == null ? null : rating,
    "relative_time_description": relativeTimeDescription == null ? null : relativeTimeDescription,
    "text": text == null ? null : text,
    "time": time == null ? null : time,
  };
}
