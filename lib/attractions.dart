import 'package:flutter/material.dart';
//TODO notification toast, vibration import

class Attraction {
  String placeID = "";
  String name = "";
  String category = "";
  String bestSeason = "";
  double rating = 0;
  String description = "";
  int priceLevel = 0;
  String startTime = "";
  String endTime = "";
  double latitude = 0;
  double longitude = 0;
  List<String> imgUrl = [];
  String thumbnail = "";
  int userRatingsTotal = 0;
  String vicinity = "";

  Attraction(
      {
      this.vicinity,
      this.placeID,
      this.name,
      this.bestSeason,
      this.category,
      this.rating,
      this.description,
      this.startTime,
      this.priceLevel,
      this.endTime,
      this.longitude,
      this.latitude,
      this.imgUrl,
      this.userRatingsTotal,
      this.thumbnail});
}