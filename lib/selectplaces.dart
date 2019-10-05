import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SelectPlaces extends StatefulWidget {
  @override
  _SelectPlacesState createState() => _SelectPlacesState();

  String placeId;
  String description;

  SelectPlaces({this.placeId, this.description});
}

class _SelectPlacesState extends State<SelectPlaces> {

  final String apikey = 'AIzaSyCQXqjK34UVxzTQW2zH9oB3WimKrYVHGpo';

  Future<void> getPost() async{
    String url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=${widget.description.split(' ').elementAt(0).toString()}+point+of+interest&language=en&key=$apikey';
    print(url);
    final response = await http.get('$url');
    print(response.body.toString());
    setState(() {});
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
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('${widget.description}', style: Theme.of(context).textTheme.title, textAlign: TextAlign.left,),
                  Text('Select the place you wish to visit', style: Theme.of(context).textTheme.body1, textAlign: TextAlign.left,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
