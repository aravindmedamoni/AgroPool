

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyFloatingActionButton extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String buttonName;
  final IconData buttonIcon;
  final Color fillColor;
  FancyFloatingActionButton({@required this.onPressed, this.buttonName, this.buttonIcon, this.fillColor});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: fillColor??Colors.deepOrange,
        splashColor: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('$buttonName',
              style: TextStyle(color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w700),),
              SizedBox(
                width: 8.0,
              ),
              Icon(
                buttonIcon??Icons.add_circle,
                color: Colors.white,
                size: 30.0,
              ),
            ],
          ),
        ),
        shape: const StadiumBorder(),
        onPressed: onPressed,
    );
  }
}
