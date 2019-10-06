import 'package:flutter/material.dart';
import 'createtrip.dart';

class SavedTripPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Container(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: ClipRRect(borderRadius: BorderRadius.circular(50.0),
                            child: Image.network(
                                'https://digitalsynopsis.com/wp-content/uploads/2015/10/gif-icons-menu-transition-animations-search.gif',
                                colorBlendMode: BlendMode.color, color: Colors.redAccent, fit: BoxFit.cover,
                            ),
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                        child: Text(
                            "Seems there are no trips saved, yet! :'(",
                            style: Theme
                                .of(context)
                                .textTheme
                                .button,
                        ),
                    ),
                    RaisedButton(
                        child: Text("Plan a Trip!"),
                        onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateTrip()));
                        },
                    )
                ],
            ),
        );
    }
}
