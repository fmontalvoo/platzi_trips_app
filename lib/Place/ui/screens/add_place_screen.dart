import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  final File image;

  const AddPlaceScreen({Key key, this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddPlaceScreen();
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            height: 300,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25, left: 5),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 45,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: screenWidth,
                  child: Container(
                    padding: EdgeInsets.only(top: 45, left: 20, right: 10),
                    child: TitleHeader(
                      title: 'Add a new place',
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
