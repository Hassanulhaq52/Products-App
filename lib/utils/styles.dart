import 'package:flutter/material.dart';

class Styles {
  static const TextStyle headingStyle =
      TextStyle(color: Colors.black, fontSize: 23);

  static BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
  );

  static const InputDecoration productsFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  static BoxDecoration addButtonDecoration =
      BoxDecoration(color: Colors.purple.shade400, shape: BoxShape.circle);
}
