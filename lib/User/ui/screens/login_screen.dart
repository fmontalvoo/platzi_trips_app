import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  UserBloc _user;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    _user = BlocProvider.of<UserBloc>(context);
    return _handleSession();
  }

  Widget _handleSession() {
    return StreamBuilder(
        stream: _user.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return loginWithGoogleUI();
          }
          return PlatziTripsCupertino();
        });
  }

  Widget loginWithGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(
            height: null,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: Container(
                width: screenWidth,
                child: Text(
                  'Bienvenido',
                  style: TextStyle(
                      fontSize: 37,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
              ButtonGreen(
                title: "Login with Gmail",
                onPressed: () {
                  _user.signIn().then((user) {
                    _user.updateUserData(User(
                        uid: user.uid,
                        nombre: user.displayName,
                        email: user.email,
                        foto: user.photoUrl));
                  });
                },
                width: 300.0,
                height: 50.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
