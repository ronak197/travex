import 'package:flutter/material.dart';
//TODO notification toast, vibration import

class Attraction {
  String name;
  String category;
  String bestSeason;
  double rating;
  String description;
  double averageCost;
  String startTime;
  String endTime;
  double latitude;
  double longitude;
  List<String> imgUrl = [];
  String thumbnail;
  int userRatingsTotal;

  Attraction(
      {this.name,
      this.bestSeason,
      this.category,
      this.rating,
      this.description,
      this.startTime,
      this.averageCost,
      this.endTime,
      this.longitude,
      this.latitude,
      this.imgUrl,
      this.userRatingsTotal,
      this.thumbnail});
}