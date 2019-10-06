import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travex/animations.dart';
import 'package:travex/attractionCard.dart' as prefix0;
import 'package:travex/attractions.dart';
import 'package:travex/budgetDetails.dart';
import 'package:travex/placedetails.dart';
import 'package:travex/placesresult.dart';
import 'package:travex/animations.dart';
import 'package:travex/attractionCard.dart';
import 'package:travex/profile.dart';
import 'package:travex/selecthotels.dart';

class SelectPlaces extends StatefulWidget {
  @override
  _SelectPlacesState createState() => _SelectPlacesState();

  String placeId;
  String description;

  SelectPlaces({this.placeId, this.description});
}

class _SelectPlacesState extends State<SelectPlaces> {

  final String apikey = 'AIzaSyCQXqjK34UVxzTQW2zH9oB3WimKrYVHGpo';

  List<Result> placesResults = new List();
  List<Attraction> attractions = new List();
  List<String> imgUrls = new List();
  static bool errorHasOccurred = false;

  Future<void> getPlacesList(List<Result> results) async {
    print('check');
    results.forEach((f) {
      attractions.add(Attraction(
        placeID: f.placeId,
        name : f.name.toString(),
        latitude : f.geometry.location.lat,
        longitude : f.geometry.location.lng,
        rating : f.rating,
        userRatingsTotal : f.userRatingsTotal,
        priceLevel: Random().nextInt(10),
        thumbnail: 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${f.photos[0].photoReference}&key=$apikey',
      ));
    });
    print(attractions);
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
      });
    });
  }


  Future<void> getPost() async{
    String url1 = 'https://www.triposo.com/api/20190906/poi.json?location_id=&annotate=trigram:gold&trigram=>=0.3&count=10&fields=id,name,score,snippet,location_id,tag_labels&order_by=-score&account=NEPTZDHL&token=ah0ku5kf4p9s9344f0rsabfvvnxqkym1';
    String url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=${widget.description.split(' ').elementAt(0).toString()}+point+of+interest&language=en&key=$apikey';
    print(url);
    final response = await http.get('$url');
    print(response.statusCode.toString());
    if(response.statusCode.toInt() != 200){
      setState(() {
        errorHasOccurred = true;
      });
    }
    else{
      placesResults = placesResultFromJson(response.body).results;
      await getPlacesList(placesResults);
    }
  }



  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: attractions.length != 0 && errorHasOccurred == false ?
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 10.0, right: 30.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BudgetDetails(placeId: widget.placeId,description: widget.description,)));
              });
            },
            color: Color(0xfff05042),
            child: Text(
              "Continue",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ) :
      SizedBox(width: 0.0, height: 0.0),
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
                  Text('${widget.description.trim()}', style: Theme.of(context).textTheme.title, textAlign: TextAlign.left,),
                  Text('Select the place you wish to visit', style: Theme.of(context).textTheme.body1, textAlign: TextAlign.left,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
              child: attractions.length != 0 && errorHasOccurred == false ?
              GridView.builder(
                shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15.0),
                  itemCount: attractions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AttractionCard(
                      obj: attractions[index],
                      selectedCard: Profile.selectedAttractions.contains(attractions[index]) == false ? false : true,
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
