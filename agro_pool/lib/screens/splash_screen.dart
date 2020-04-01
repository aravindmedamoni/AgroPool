
import 'dart:async';

import 'package:agro_pool/model/user.dart';
import 'package:agro_pool/screens/farmer_home_page.dart';
import 'package:agro_pool/screens/custom_email_login_page.dart';
import 'package:agro_pool/screens/login_page_with_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   //getting the user
    final user = Provider.of<User>(context);
    if(user == null){
     return LoginPageWithApi();
    }else{
      return FarmerHomePage();
      }
    }
//    return SafeArea(child: Scaffold(
//      body: Stack(
//        fit: StackFit.expand,
//        children: <Widget>[
//          Container(
//            decoration: BoxDecoration(
//              color: Colors.greenAccent,
//            ),
//          ),
//          Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              Expanded(
//                flex: 2,
//                child: Container(
//                  child: Column(
//                    children: <Widget>[
//                      CircleAvatar(
//                        backgroundColor: Colors.white,
//                        radius: 60.0,
//                        child: Image.asset('images/logo.png'),
//                      ),
//                      SizedBox(
//                        height: 10.0,
//                      ),
//                      Text('Agro Pool', style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 26.0,
//                        fontWeight: FontWeight.bold,
//                      ),),
//                    ],
//                    mainAxisAlignment: MainAxisAlignment.center,
//                  ),
//                ),
//              ),
//              Expanded(
//                flex: 1,
//                child: Column(
//                  children: <Widget>[
//                    SpinKitCircle(
//                      color: Colors.deepOrangeAccent,
//                      size: 60.0,
//                    ),
//                    SizedBox(
//                      height: 15.0,
//                    ),
//                    Text('    A Companion for \n Farmers And Buyers.', style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w700),)
//                  ],
//
//                ),
//              )
//            ],
//          )
//        ],
//      ),
//    ));
  }

