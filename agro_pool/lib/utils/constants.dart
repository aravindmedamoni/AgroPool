
import 'package:flutter/material.dart';


const kTextFieldDecoration = InputDecoration(
  prefixIcon: Icon(null),
  filled: true,
  fillColor: Colors.white,
  hintText: '',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kTextFieldTextStyle = TextStyle(
  color: Colors.black87,
  fontWeight: FontWeight.w600,
);

const kAppBarContainerDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0XFF028D8F),
        Color(0XFF014973),

      ]
  ),
);