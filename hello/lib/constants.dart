import 'package:flutter/material.dart';

const kMessageTextField = InputDecoration(
  hintStyle: TextStyle(color: Colors.white),
  hintText: 'type Something',
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  hintText: "Enter your value",
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
