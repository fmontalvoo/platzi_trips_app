import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/ui/screens/login_screen.dart';
import 'User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: Login(),
      ),
      bloc: UserBloc(),
    );
  }
}
