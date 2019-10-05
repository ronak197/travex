import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:travex/predictaddress.dart';
import 'package:http/http.dart' as http;
import 'package:travex/selectplaces.dart';

class CreateTrip extends StatefulWidget {
  @override
  _CreateTripState createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute( builder: (context) => SearchDestination()));
                },
                child: Card(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.search),
                        padding: EdgeInsets.all(15.0),
                      ),
                      Text('Try \'Kerala\''),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              SvgPicture.asset('assets/letstravel.svg'),
              Text('Search for the destination you wish for', style: Theme.of(context).textTheme.subtitle, )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchDestination extends StatefulWidget {
  @override
  _SearchDestinationState createState() => _SearchDestinationState();
}

class _SearchDestinationState extends State<SearchDestination> {

  static String destination;
  TextEditingController txt;

  final String apikey = 'AIzaSyCQXqjK34UVxzTQW2zH9oB3WimKrYVHGpo';

  List<String> predictedaddr = new List();
  List<Prediction> predictionList = new List();

  Future<void> getPredAddrList(List<Prediction> predictionList) async {
    predictionList.forEach((f) {predictedaddr.add(f.description.toString());});
  }

  Future<void> getPost() async{
    String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${txt.text.toString()}&key=$apikey';
    print(url);
    final response = await http.get('$url');
    predictionList = addressPredictedFromJson(response.body).predictions;
    await getPredAddrList(predictionList);
    setState(() {});
    print(predictedaddr);
  }

  @override
  void initState() {
    txt = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        bottom: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: TextFormField(
            controller: txt,
            decoration: InputDecoration(
              hintText: "Where to?",
              contentPadding: EdgeInsets.only(left: 50.0,right: 20.0, top: 10.0, bottom: 10.0),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black87,
            ),
            cursorColor: Colors.black,
            onChanged: (value) {
              setState(() {
                destination = value;
                print(destination);
                predictedaddr.clear();
                getPost();
              });
            },
          ),
        ),
      ),
      body: (
        predictedaddr.length != 0 ? ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return new ListTile(
                trailing: Icon(Icons.location_searching),
                title: new Text(predictedaddr[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (
                              SelectPlaces(
                                placeId: predictionList[index].placeId,
                                description: predictionList[index].description,
                              )
                          )
                      )
                  );
                },
              );
            }) : SizedBox(width: 0.0, height: 0.0,)
      ),
    );
  }
}

