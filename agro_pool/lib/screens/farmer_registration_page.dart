import 'dart:collection';

import 'package:agro_pool/screens/farmer_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agro_pool/utils/constants.dart';
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class FarmerRegisterScreen extends StatefulWidget {
  @override
  _FarmerRegisterScreenState createState() => _FarmerRegisterScreenState();
}

class _FarmerRegisterScreenState extends State<FarmerRegisterScreen> {
  List<String> district = [
    'Select District',
    'Ranga Reddy',
    'Hyderabad',
    'MahabubNagar',
    'Nagar Kurnool',
    'KarimNagar',
    'Sidhipet',
    'Janagama',
    'Vanaparthy'
  ];

  String selectedDistrictName = 'Select District';

  final nameTextEditingController = TextEditingController();
  final mailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final mobileNumberTextEditingController = TextEditingController();
  final registrationNumTextEditingController = TextEditingController();

  bool inVisiblePass = true;
  bool isProgressVisible = false;

  //Getting FirebaseAuth instance
  final _auth = FirebaseAuth.instance;
  final _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.grey[350],
            child: ModalProgressHUD(
              inAsyncCall:isProgressVisible ,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60.0,
                          child: Image.asset('images/logo.png'),
                        ),
                        Text('Agro Pool', style: TextStyle(color: Colors.grey[850],fontWeight: FontWeight.bold,fontSize: 26.0),),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Material(
                            elevation: 5.0,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            child: TextField(
                                controller: nameTextEditingController,
                                keyboardType: TextInputType.text,
                                style: kTextFieldTextStyle,
                                // imported from utils/constants.dart
                                decoration: kTextFieldDecoration.copyWith(
                                  // imported from utils/constants.dart
                                  hintText: 'Enter Your Name',
                                  prefixIcon: Icon(Icons.person_pin),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Material(
                            elevation: 5.0,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            child: TextField(
                                controller: mailTextEditingController,
                                keyboardType: TextInputType.emailAddress,
                                style: kTextFieldTextStyle,
                                // imported from utils/constants.dart
                                decoration: kTextFieldDecoration.copyWith(
                                  // imported from utils/constants.dart
                                  hintText: 'Enter Your Email',
                                  prefixIcon: Icon(Icons.email),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Material(
                            elevation: 5.0,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            child: TextField(
                                obscureText: inVisiblePass,
                                controller: passwordTextEditingController,
                                keyboardType: TextInputType.text,
                                style: kTextFieldTextStyle,
                                // imported from utils/constants.dart
                                decoration: kTextFieldDecoration.copyWith(
                                  // imported from utils/constants.dart
                                    hintText: 'Enter Your Passowrd',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(icon: inVisiblePass ? Icon(Icons.visibility_off):Icon(Icons.visibility), onPressed: (){
                                      setState(() {
                                        inVisiblePass = !inVisiblePass;
                                      });
                                    })
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Material(
                            elevation: 5.0,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            child: TextField(
                                controller: mobileNumberTextEditingController,
                                keyboardType: TextInputType.number,
                                style: kTextFieldTextStyle,
                                // imported from utils/constants.dart
                                decoration: kTextFieldDecoration.copyWith(
                                  // imported from utils/constants.dart
                                  hintText: 'Enter Your Mobile Number',
                                  prefixIcon: Icon(Icons.keyboard),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Material(
                            elevation: 5.0,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            child: TextField(
                                controller: registrationNumTextEditingController,
                                keyboardType: TextInputType.text,
                                style: kTextFieldTextStyle,
                                // imported from utils/constants.dart
                                decoration: kTextFieldDecoration.copyWith(
                                  // imported from utils/constants.dart
                                  hintText: 'Enter your crop name',
                                  prefixIcon: Icon(Icons.keyboard),
                                )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Select District:',
                              style: TextStyle(
                                  color: Colors.brown[700],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            DropdownButton<String>(
                              itemHeight: 70.0,
                              items: district
                                  .map<DropdownMenuItem<String>>((String dropDownMenuItem) {
                                return DropdownMenuItem(
                                  value: dropDownMenuItem,
                                  child: Text(dropDownMenuItem),
                                );
                              }).toList(),
                              value: selectedDistrictName,
                              elevation: 20,
                              style: TextStyle(
                                color: Colors.grey[900],
                              ),
                              icon: Icon(Icons.keyboard_arrow_down,size: 30.0,color: Colors.blue,),
                              onChanged: (districtName) {
                                setState(() {
                                  selectedDistrictName = districtName;
                                });
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0,vertical: 12.0),
                          child: RoundedRectangleButton(
                            onPress: () async {
                              setState(() {
                                isProgressVisible = true;
                              });
                              try {
                                var user = await _auth.createUserWithEmailAndPassword(
                                    email: mailTextEditingController.text,
                                    password: passwordTextEditingController.text);
                                _fireStore.collection('Dealers').add({
                                  'name':'${nameTextEditingController.text}',
                                  'mail':'${mailTextEditingController.text}',
                                  'password':'${passwordTextEditingController.text}',
                                  'mobile number':'${mobileNumberTextEditingController.text}',
                                  'registration num': '${registrationNumTextEditingController.text}',
                                  'district':'$selectedDistrictName'

                                });
                                if (user != null) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return FarmerHomePage();
                                      }));
                                  Toast.show('User Registration is Success', context,backgroundRadius: 16.0);
                                }
                                nameTextEditingController.clear();
                                mailTextEditingController.clear();
                                passwordTextEditingController.clear();
                                mobileNumberTextEditingController.clear();
                                registrationNumTextEditingController.clear();
                                selectedDistrictName = 'select district';
                                setState(() {
                                  isProgressVisible = false;
                                });
                              } catch (e) {
                                print(e);
                                setState(() {
                                  isProgressVisible = false;
                                });
                              }

                            },
                            buttonName: 'Register',
                            buttonColor: Colors.lightBlue,
                            borderColor: Colors.white70,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 100.0),
                          child: IconButton(icon: Icon(Icons.arrow_back,size: 30.0,), onPressed: (){
                            Navigator.of(context).pop();
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
