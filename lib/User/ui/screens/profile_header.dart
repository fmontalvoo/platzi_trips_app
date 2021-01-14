import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/button_bar.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileHeader();
}

class _ProfileHeader extends State<ProfileHeader> {
  UserBloc _userBloc;
  User _user;
  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);
    return init(context);
  }

  Widget init(BuildContext context) {
    return StreamBuilder(
        stream: _userBloc.authStatus,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return profileData(snapshot);
        });
  }

  Widget profileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Error al recuperar datos.'),
            )
          ],
        ),
      );
    } else {
      print(snapshot.data);
      _user = User(
          nombre: snapshot.data.displayName,
          email: snapshot.data.email,
          foto: snapshot.data.photoUrl);
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfo(user: _user),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}
