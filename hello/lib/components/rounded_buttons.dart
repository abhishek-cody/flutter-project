import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.color, this.title, @required this.onPressed});
  final Color color;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 120.0,
          height: 40.0,
          child: Text(title),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
