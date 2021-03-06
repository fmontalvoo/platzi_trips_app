import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc _user;
  @override
  Widget build(BuildContext context) {
    _user = BlocProvider.of<UserBloc>(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleButton(
              mini: true,
              icon: Icons.vpn_key,
              iconSize: 20.0,
              color: Color.fromRGBO(255, 255, 255, 0.6),
              onPressed: () {},
            ),
            CircleButton(
              mini: false,
              icon: Icons.add,
              iconSize: 40.0,
              color: Color.fromRGBO(255, 255, 255, 1),
              onPressed: () {
                File iamge;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AddPlaceScreen(
                            image: iamge,
                          )),
                );
              },
            ),
            CircleButton(
              mini: true,
              icon: Icons.exit_to_app,
              iconSize: 20.0,
              color: Color.fromRGBO(255, 255, 255, 0.6),
              onPressed: () {
                _user.signOut();
              },
            ),
          ],
        ));
  }
}
