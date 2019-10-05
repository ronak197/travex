import 'package:flutter/material.dart';
import 'classes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AttractionPage extends StatefulWidget {
    final Attraction obj;

    AttractionPage(this.obj);

  @override
  _AttractionPageState createState() => _AttractionPageState();
}

class _AttractionPageState extends State<AttractionPage> {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
          body: Container(
              child: Hero(
                  tag: widget.obj.name,
                  child: CarouselSlider(
                      height: 400.0,
                      items: [1,2,3,4,5].map((i) {
                          return Builder(
                              builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.obj.imgUrl),fit: BoxFit.cover),),
                                      child: Container()
                                  );
                              },
                          );
                      }).toList(),
                  ),
              ),
          ),
        );
    }
}
