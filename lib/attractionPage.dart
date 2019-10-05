import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travex/animations.dart';
import 'package:travex/utility.dart';
import 'package:travex/attractions.dart';

//TODO cache images retrieved from network
class AttractionPage extends StatefulWidget {
  final Attraction obj;

  AttractionPage(this.obj);

  @override
  _AttractionPageState createState() => _AttractionPageState();
}

class _AttractionPageState extends State<AttractionPage> {
  bool selected = false;

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
                    title: Text(widget.obj.name),
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
                              child: Text('Address', style: Theme.of(context).textTheme.title),
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
                                'This is a beach',
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                  child: Text("Average Estimated cost", style: Theme.of(context).textTheme.subtitle),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                  child: Text(
                                    'Free' + "\$ per person",
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                ),
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
                SizedBox(
                  height: 70.0,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
//TODO make this a statefull buttton
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            side: BorderSide(color: selected ? Colors.green : Colors.black, width: 0.5)),
                        onPressed: () {
//TODO add to list here
//TODO go back
                          setState(() {
                            selected = !selected;
                          });
                          print("added to trip");
                        },
                        color: !selected ? Colors.white : Color(0xfff05042),
                        child: selected
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Added to trip",
                                    style: TextStyle(color: Colors.green),
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
                )
              ],
            )),
      ),
    );
  }
}
