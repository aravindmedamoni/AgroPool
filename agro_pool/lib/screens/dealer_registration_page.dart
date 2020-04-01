import 'dart:collection';

import 'package:agro_pool/screens/farmer_home_page.dart';
import 'package:agro_pool/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agro_pool/utils/constants.dart';
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class DealerRegisterScreen extends StatefulWidget {
  @override
  _DealerRegisterScreenState createState() => _DealerRegisterScreenState();
}

class _DealerRegisterScreenState extends State<DealerRegisterScreen> {
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

  //Global Key for the form
  final _formKey = GlobalKey<FormState>();

  //Getting AuthService instance
  final AuthService _authService = AuthService();
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
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          child: TextFormField(
                            validator: (name) => name.isEmpty ? 'Please enter the name' : null,
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
                          child: TextFormField(
                             validator: (email) => email.isEmpty ? 'Please enter your email' : null,
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
                          child: TextFormField(
                            validator: (password) => password.length <6 ? 'Password shoulb be minimum 6 characters' : null,
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
                          child: TextFormField(
                            validator: (mobileNumber) => mobileNumber.length < 10 ? 'Enter valid mobile number': null,
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
                          child: TextFormField(
                            validator: (registrationNumber) => registrationNumber.isEmpty ? 'Please enter your registration number' : null,
                              controller: registrationNumTextEditingController,
                              keyboardType: TextInputType.text,
                              style: kTextFieldTextStyle,
                              // imported from utils/constants.dart
                              decoration: kTextFieldDecoration.copyWith(
                                // imported from utils/constants.dart
                                hintText: 'Enter Your Registration Number',
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
                            icon: Icon(Icons.keyboard_arrow_down,color: Colors.blue, size: 30.0,),
                            onChanged: (districtName) {
                              setState(() {
                                selectedDistrictName = districtName;
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0,vertical: 12.0),
                        child: RoundedRectangleButton(
                          onPress: () async {
                            setState(() {
                              isProgressVisible = true;
                            });
                            //Here we are validating the form
                            if(_formKey.currentState.validate()){
                              dynamic result = await _authService.registerWithEmailAndPassword(
                                  email: mailTextEditingController.text,
                                  password: passwordTextEditingController.text,
                                  mobileNumber: mobileNumberTextEditingController.text,
                                  name: nameTextEditingController.text,
                                  district: selectedDistrictName,
                                  rgtrNumOrCropName: registrationNumTextEditingController.text
                              );
                              if(result == null){
                                Toast.show('something went wrong', context,duration: 2);
                              }else{
                                Toast.show('Successfully Registered', context,duration: 2);
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
                            }
                            try {
                              _fireStore.collection('Dealers').add({
                                'name':'${nameTextEditingController.text}',
                                'mail':'${mailTextEditingController.text}',
                                'password':'${passwordTextEditingController.text}',
                                'mobile number':'${mobileNumberTextEditingController.text}',
                                'registration num': '${registrationNumTextEditingController.text}',
                                'district':'$selectedDistrictName'

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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
