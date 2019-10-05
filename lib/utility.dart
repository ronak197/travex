import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

class CarouselWithIndicator extends StatefulWidget {
    @override
    _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
    int _current = 0;

    @override
    Widget build(BuildContext context) {
        return Stack(
            children: [
                CarouselSlider(
                    items: child,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    onPageChangedCallback: (index) {
                        setState(() {
                            _current = index;
                        });
                    },
                ),
                Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(imgList, (index, url) {
                            return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                                ),
                            );
                        }),
                    )
                )
            ]
        );
    }
}
