import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travex/attractions.dart';
import 'package:travex/placesresult.dart';

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

  Future<void> getPlacesList(List<Result> results) async {
    print('check');
    results.forEach((f) {
      Attraction attraction = new Attraction();
      attraction.name = f.name.toString();
      attraction.latitude = f.geometry.location.lat;
      attraction.longitude = f.geometry.location.lng;
      attraction.rating = f.rating;
      attraction.userRatingsTotal = f.userRatingsTotal;
      attraction.imgUrl = 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${f.photos[0].photoReference}&key=$apikey';
      attractions.add(attraction);
    });
    print(attractions);
    setState(() {
    });
  }

  Future<void> getPost() async{
    String url1 = 'https://www.triposo.com/api/20190906/poi.json?location_id=&annotate=trigram:gold&trigram=>=0.3&count=10&fields=id,name,score,snippet,location_id,tag_labels&order_by=-score&account=NEPTZDHL&token=ah0ku5kf4p9s9344f0rsabfvvnxqkym1';
    String url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=${widget.description.split(' ').elementAt(0).toString()}+point+of+interest&language=en&key=$apikey';
    print(url);
    final response = await http.get('$url');
    print(response.body);
    placesResults = placesResultFromJson(response.body).results;
    await getPlacesList(placesResults);
//    setState(() {
//
//    });
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
//        Column(
//          children: <Widget>[
//            Container(
//              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  Text('${widget.description.trim()}', style: Theme.of(context).textTheme.title, textAlign: TextAlign.left,),
//                  Text('Select the place you wish to visit', style: Theme.of(context).textTheme.body1, textAlign: TextAlign.left,),
//                ],
//              ),
//            ),
//,
//          ],
//        ),
          attractions.length != 0 ?
          ListView.builder(
              itemCount: attractions.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: <Widget>[
                    AttractionCard(
                      obj: attractions[index],
                    ),AttractionCard(
                      obj: attractions[index+1],
                    ),
                  ],
                );
              }) :
          SizedBox(height: 0.0,width: 0.0)
      ),
    );
  }
}
