
import 'package:flutter/material.dart';
import 'package:agro_pool/utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({this.height, this.profilerName, this.trailIconButton, this.onPress});
  final String profilerName;
  final IconData trailIconButton;
  final Function onPress;
  final double height;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??180.0,
      width: double.infinity,
      decoration: kAppBarContainerDecoration,// getting from constants.dart file
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 6.0),
        child: Column(
          children: <Widget>[
            Text('Profile',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w800),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
//            Column(
//              children: <Widget>[
//                CircleAvatar(
//                  radius: 40,
//                  backgroundColor: Color(0XFF01366F),
//                  child: CircleAvatar(
//                    radius: 45,
//                    backgroundColor: null,
//                    //active ? Colors.white.withOpacity(0.9) : Colors.transparent,
//                    child: Icon(
//                      Icons.person_pin, size: 50.0,
//                      color: Colors.white70,
//                      //color: active ? Colors.black : Colors.white.withOpacity(0.9),
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  height: 10.0,
//                ),
//                Text(
//                  profilerName??'Hey Aravind',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontWeight: FontWeight.w700,
//                    fontSize: 16.0,
//                  ),
//                ),
//              ],
//            ),

                IconButton(
                    icon: Icon(
                      trailIconButton,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: onPress??() {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}