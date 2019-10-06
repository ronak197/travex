import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travex/animations.dart';
import 'package:travex/placedetails.dart';
import 'package:travex/utility.dart';
import 'package:travex/attractions.dart';
import 'package:http/http.dart' as http;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travex/profile.dart';

//TODO cache images retrieved from network
class HotelAttractionPage extends StatefulWidget {
  final Attraction obj;
  bool selected;

  HotelAttractionPage({this.obj,this.selected});

  @override
  _HotelAttractionPageState createState() => _HotelAttractionPageState();
}

class _HotelAttractionPageState extends State<HotelAttractionPage> {

  final String apikey = 'AIzaSyCQXqjK34UVxzTQW2zH9oB3WimKrYVHGpo';

  static bool errorHasOccurred = false;
  PlaceDetailsResult placeDetail;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget attractionCarousel() {
    return CarouselSlider(
      height: 400.0,
      autoPlay: true,
      autoPlayAnimationDuration: Duration(milliseconds: 500),
      autoPlayCurve: ElasticInCurve(2.0),
      viewportFraction: 1.0,
      aspectRatio: 2.0,
      enlargeCenterPage: false,
      items: map<Widget>([widget.obj.thumbnail], (index, i) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(i), fit: BoxFit.cover),
          ),
        );
      }),
    );
  }

  Future<void> getDetails() async{
    String url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=${widget.obj.placeID}&fields=name,rating,formatted_phone_number,price_level,vicinity&key=$apikey';
    print(url);
    final response = await http.get('$url');
    print(response.body.toString());
    if(response.statusCode.toInt() != 200){
      setState(() {
        errorHasOccurred = true;
      });
    }
    else{
      setState(() {
        placeDetail = placeDetailsFromJson(response.body).result;
      });
    }
  }

  @override
  void initState() {
    getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 400.0,
                  titleSpacing: 0.0,
                  primary: false,
                  floating: false,
                  pinned: true,
                  snap: false,
                  backgroundColor: Colors.black,
                  elevation: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: AutoSizeText(widget.obj.name, textAlign: TextAlign.left,),
                    background: attractionCarousel(),
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                  ),
                ),
              ];
            },
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: placeDetail == null ?
                              Text('Address', style: Theme.of(context).textTheme.subtitle,):
                              Text(placeDetail.vicinity, style: Theme.of(context).textTheme.subtitle,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: StarDisplay(value: widget.obj.rating.round()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Text(
                                'category',
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Text("Description", style: Theme.of(context).textTheme.subtitle),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Text(
                                'Here the Description will appear.',
                                style: Theme.of(context).textTheme.body2,
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Text("Best Season to Visit", style: Theme.of(context).textTheme.subtitle),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Text(
                                'summer',
                                style: Theme.of(context).textTheme.body2,
                              ),
                            ),
                            Divider(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                      child: Text("Open time", style: Theme.of(context).textTheme.subtitle),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                      child: Text(
                                        '10:00AM',
                                        style: Theme.of(context).textTheme.body2,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                      child: Text("Closing time", style: Theme.of(context).textTheme.subtitle),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                      child: Text(
                                        '7:00PM',
                                        style: Theme.of(context).textTheme.body2,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Text("Reviews", style: Theme.of(context).textTheme.subtitle),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Text("Review List view builder here",
                                  style: Theme.of(context).textTheme.subtitle), //TODO review Listview builder
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Text("Nearby Accomodations", style: Theme.of(context).textTheme.subtitle),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Text("Nearby accomodation List view builder here",
                                  style: Theme.of(context).textTheme.subtitle), //TODO similar Listview builder
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: widget.obj.priceLevel != null ?
                        Text('${(widget.obj.priceLevel * 100)}' + 'Rs/person', style: Theme.of(context).textTheme.body1,) :
                        Text('Free Entry', style: Theme.of(context).textTheme.body2,),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 10.0, right: 30.0),
                        child: RaisedButton(
//TODO make this a statefull buttton
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                side: BorderSide(color: widget.selected ? Colors.green : Colors.black, width: 0.5)),
                            onPressed: () {
                              setState(() {
                                if(widget.selected == false){
                                  Profile.selectedHotels.add(widget.obj);
                                }
                                else {
                                  Profile.selectedHotels.remove(widget.obj);
                                }
                                widget.selected = !widget.selected;
                              });
                              print("added to trip");
                            },
                            color: !widget.selected ? Colors.white : Color(0xfff05042),
                            child: widget.selected
                                ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Added to trip",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.add),
                                Text("Add to trip"),
                              ],
                            )),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
