import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:travex/predictaddress.dart';
import 'package:http/http.dart' as http;
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

  final _formKey = GlobalKey<FormState>();
  static String destination;


  Future<AddressPredicted> getPost() async{
    String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$destination&key=AIzaSyCQXqjK34UVxzTQW2zH9oB3WimKrYVHGpo';
    final response = await http.get('$url');
    print(addressPredictedFromJson(response.body).predictions.elementAt(0).description.toString());
    return addressPredictedFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.close,color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
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
              validator: (value) {
                if(value.isEmpty){
                  return 'Enter a destination';
                }
                else return destination = value;
              },
              onChanged: (value) {
                destination = value;
                print(destination);
                getPost();
              },
            )
          ],
        ),
      ),
    );
  }
}

