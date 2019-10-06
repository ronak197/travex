import 'package:flutter/material.dart';
import 'attractionPage.dart';
import 'utility.dart';
import 'attractions.dart';
import 'package:travex/profile.dart';

class HotelAttractionCard extends StatefulWidget {
  final Attraction obj;
  bool selectedCard = false;

  HotelAttractionCard({this.obj, this.selectedCard});

  @override
  _HotelAttractionCardState createState() => _HotelAttractionCardState();
}

class _HotelAttractionCardState extends State<HotelAttractionCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Card(
        elevation: 0.0,
        margin: EdgeInsets.all(0.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HotelAttractionPage(obj: widget.obj,selected: widget.selectedCard)));
            print("launch attraction page");
          },
          child: Container(
            width: 175.0,
            height: 280.0,
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
                            tag: widget.obj.name,
                            child: Image.network(
                              widget.obj.thumbnail,
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
                          top: 10.0,
                          right: 10.0,
                          child: SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  if(widget.selectedCard == false){
                                    Profile.selectedAttractions.add(widget.obj);
                                  }
                                  else {
                                    Profile.selectedAttractions.remove(widget.obj);
                                  }
                                  widget.selectedCard = !widget.selectedCard;
                                });
                              },
                              child: !widget.selectedCard
                                  ? Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 20.0,
                              )
                                  : Icon(
                                Icons.favorite,
                                color: Color(0xfff05042),
                                size: 20.0,
                              ),
                              shape: new CircleBorder(side: BorderSide(width: 1.0, color: Colors.white.withOpacity(0.3))),
                              elevation: 0.0,
                              fillColor: Colors.white.withOpacity(0.3),
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
                    widget.obj.name,
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
                      child: StarDisplay(value: widget.obj.rating.round())),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, bottom: 0.0),
                    child: widget.obj.priceLevel != 0 ?
                    Text( '${widget.obj.priceLevel * 100}' + "Rs per person", style: TextStyle(fontSize: 12.0)):
                    Text('Free Entry', style: TextStyle(fontSize: 12.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}