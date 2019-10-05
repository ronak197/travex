import 'package:flutter/material.dart';
//TODO notification toast, vibration import

class Attraction {
  final String name;
  final String category;
  final String bestSeason;
  final double rating;
  final String description;
  final double averageCost;
  final String startTime;
  final String endTime;
  final double latitude;
  final double longitude;
  final String imgUrl;

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
      this.imgUrl});
}

class AttractionCard extends StatelessWidget {
  final Attraction obj;

  AttractionCard({this.obj});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () {
          //TODO link to attraction page and add hero animation
          print("launch attraction page");
        },
        child: Container(
          width: 175.0,
          height: 260.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Container(
                  height: 175.0,
                  width: 175.0,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Hero(
                          tag: obj.name,
                          child: Image.network(
                            obj.imgUrl,
                            fit: BoxFit.cover,
                            height: 175.0,
                            width: 175.0,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 175.0,
                                width: 175.0,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        //TODO make this button statefull and indicate selected locations
                        top: 10.0,
                        right: 10.0,
                        child: SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: RawMaterialButton(
                            onPressed: () {},
                            child: new Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            shape: new CircleBorder(),
                            elevation: 1.0,
                            fillColor: Colors.transparent,
                            padding: const EdgeInsets.all(0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                child: Text(
                  obj.name,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          side: BorderSide(color: Colors.white70)),
                    ),
                    child: StarDisplay(value: obj.rating.round())),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                  child: Text(
                    obj.averageCost.toString() + " \$ per person",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttractionPage extends StatelessWidget {
  final Attraction obj;

  AttractionPage({this.obj});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Hero(
        tag: obj.name,
        child: Image.network(obj.imgUrl),
      ),
    );
  }
}

class StarDisplay extends StatelessWidget {
  final int value;

  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            index < value ? Icons.star : Icons.star_border,
            size: 12.0,
          );
        }),
      ),
    );
  }
}
