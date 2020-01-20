
import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {

  final Function onPress;
  final String buttonName;
  final Color buttonColor;
  final Color borderColor;


  RoundedRectangleButton({@required this.onPress, @required this.buttonName, @required this.buttonColor,this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: buttonColor,
      shape: borderColor!=null? RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),side: BorderSide(color: borderColor,width: 2.0,style: BorderStyle.solid)):RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      child: MaterialButton(
        onPressed: onPress,
        minWidth: 100.0,
        splashColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        height: 36.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 26.0),
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}