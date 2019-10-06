import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:travex/animations.dart';
import 'package:travex/attractionCard.dart' as prefix0;
import 'package:travex/attractions.dart';
import 'package:travex/placedetails.dart';
import 'package:travex/placesresult.dart';
import 'package:travex/animations.dart';
import 'package:travex/attractionCard.dart';
import 'package:travex/profile.dart';
import 'dart:io';
import 'package:travex/postclasses.dart';
import 'dart:math';

class RecommendationPage extends StatefulWidget {

  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {

  final String apikey = 'AIzaSyCQXqjK34UVxzTQW2zH9oB3WimKrYVHGpo';

  List<Result> hotelResults = new List();
  PlaceDetails placeDetails = new PlaceDetails();
  List<Attraction> potentialHotels = new List();

  List<String> imgUrls = new List();
  static bool errorHasOccurred = false;
  String lat = "";
  String lng = "";

  List<double> lats = new List<double>();
  List<double> lngs = new List<double>();

  Future<void> getHotelsList(List<Result> results) async {
    print('check');
    results.forEach((f) {
      potentialHotels.add(Attraction(
        placeID: f.placeId,
        name : f.name.toString(),
        latitude : f.geometry.location.lat,
        longitude : f.geometry.location.lng,
        rating : f.rating,
        userRatingsTotal : f.userRatingsTotal,
        vicinity: f.vicinity,
        priceLevel: (Random().nextInt(10)+1)*10,
        thumbnail: 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${f.photos[0].photoReference}&key=$apikey',
      ));
    });
    print(potentialHotels);
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
      });
    });
  }

  List<Attraction> getPotentialHotels(){
    List<Attraction> potentialHotels = new List<Attraction>();
    Profile.selectedHotels.forEach((h){
      int sum = h.priceLevel*10;
      Profile.selectedAttractions.forEach((a){sum += a.priceLevel*10;});
      if(sum <= Profile.budget){
        potentialHotels.add(h);
      }
    });
    return potentialHotels;
  }


  @override
  void initState() {
    getPotentialHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 10.0, right: 30.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            onPressed: () {
              setState(() {

              });
            },
            color: Color(0xfff05042),
            child: Text(
              "Save Trip",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Recommendation', style: Theme.of(context).textTheme.title, textAlign: TextAlign.left,),
                  Text('The total trip cost is ', style: Theme.of(context).textTheme.body1, textAlign: TextAlign.left,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
              child: potentialHotels.length != 0 && errorHasOccurred == false ?
              GridView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15.0),
                  itemCount: potentialHotels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AttractionCard(
                      obj: potentialHotels[index],
                      selectedCard: Profile.selectedHotels.contains(potentialHotels[index]) == false ? false : true,
                    );
                  }) :
              errorHasOccurred == false ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 150.0),
                child: FadingBoxes(),
              ) :
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 150.0),
                child: Text('Some Error has ocurred'),
              )
              ,
            ),
          ],
        ),

      ),
    );
  }
}
