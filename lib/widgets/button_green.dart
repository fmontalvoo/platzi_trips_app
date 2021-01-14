import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  double width = 0.0;
  double height = 0.0;

  ButtonGreen(
      {Key key,
      @required this.title,
      @required this.onPressed,
      this.width,
      this.height});

  @override
  State<StatefulWidget> createState() => _ButtonGreen();
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                colors: [Color(0xFFa7ff84), Color(0xFF1cbb78)],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
