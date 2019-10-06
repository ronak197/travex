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
import 'package:travex/recommendationPage.dart';

class SelectHotels extends StatefulWidget {

  String placeId;
  String description;

  SelectHotels({this.placeId,this.description});

  @override
  _SelectHotelsState createState() => _SelectHotelsState();
}

class _SelectHotelsState extends State<SelectHotels> {

  final String apikey = 'AIzaSyCQXqjK34UVxzTQW2zH9oB3WimKrYVHGpo';

  List<Result> hotelResults = new List();
  PlaceDetails placeDetails = new PlaceDetails();
  List<Attraction> hotels = new List();

  List<String> imgUrls = new List();
  static bool errorHasOccurred = false;
  String lat = "";
  String lng = "";

  List<double> lats = new List<double>();
  List<double> lngs = new List<double>();

  Future<void> getHotelsList(List<Result> results) async {
    print('check');
    results.forEach((f) {
      hotels.add(Attraction(
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
    print(hotels);
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
      });
    });
  }

  Future<void> getCoords() async{
    String url = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=${widget.placeId}&key=$apikey';
    final response = await http.get('$url');
    placeDetails = placeDetailsFromJson(response.body);
    setState(() {
      lat = placeDetails.result.geometry.location.lat.toString();
      lng = placeDetails.result.geometry.location.lng.toString();
    });
  }

  Future<void> getHotels() async{
    await getCoords();
    String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?&key=$apikey&location=$lat,$lng&radius=50000&keyword=hotel';
    final response = await http.get('$url');
    if(response.statusCode.toInt() != 200){
      setState(() {
        errorHasOccurred = true;
      });
    }
    else{
      hotelResults = placesResultFromJson(response.body).results;
      await getHotelsList(hotelResults);
    }
  }

  Future<LocationPostParams> createPostGetClusterCoords(LocationPostParams locationPostParams) async{
    String url = 'https://127.0.0.1:12345/predict';
    final response = await http.post('$url',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: locationPostParamsToJson(locationPostParams)
    );
    return locationPostParamsFromJson(response.body);
  }

  bool setCoordToList(){
    Profile.selectedAttractions.forEach((f) =>
      lngs.add(f.longitude)
    );
    Profile.selectedAttractions.forEach((f) =>
        lats.add(f.latitude)
    );
    return true;
  }

  @override
  void initState() {
    setCoordToList();
    print(lats);
    print(lngs);
    LocationPostParams l = LocationPostParams(
      lat: lats,
      lng: lngs
    );
    createPostGetClusterCoords(l);
    print(locationPostParamsToJson(l));
    getHotels();
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecommendationPage()));
              });
            },
            color: Color(0xfff05042),
            child: Text(
              "Continue",
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
                  Text('${widget.description}', style: Theme.of(context).textTheme.title, textAlign: TextAlign.left,),
                  Text('Select the hotels you wish to stay in', style: Theme.of(context).textTheme.body1, textAlign: TextAlign.left,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
              child: hotels.length != 0 && errorHasOccurred == false ?
              GridView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15.0),
                  itemCount: hotels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AttractionCard(
                      obj: hotels[index],
                      selectedCard: Profile.selectedHotels.contains(hotels[index]) == false ? false : true,
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
