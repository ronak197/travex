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