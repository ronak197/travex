import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travex/selecthotels.dart';
import 'package:travex/profile.dart';
import 'dart:convert';


class BudgetDetails extends StatefulWidget {

  String placeId;
  String description;

  BudgetDetails({this.placeId,this.description});

  @override
  _BudgetDetailsState createState() => _BudgetDetailsState();
}

class _BudgetDetailsState extends State<BudgetDetails> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 10.0, right: 30.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectHotels(placeId: widget.placeId,description: widget.description,)));
              });
            },
            color: Color(0xfff05042),
            child: Text(
              "Continue",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                child: Container(
                  child: Text('Enter Budget', style: TextStyle(fontFamily: 'WorkSans', fontSize: 25.0, fontWeight: FontWeight.bold),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only( left: 15.0, right: 15.0, top: 30.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.attach_money, color: Colors.black54,),
                    labelText: 'Budget in Rupees',
                  ),
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) => (value is int)
                      ? null
                      : 'Enter valid number',
                  onSaved: (val) => Profile.budget = val as int,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( left: 15.0, right: 30.0, top: 30.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.view_day, color: Colors.black54,),
                    labelText: 'Number of days',
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) => (value is int)
                  ? null
                  : 'Enter valid number',
                  onSaved: (val) => Profile.noOfDays = val as int,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
