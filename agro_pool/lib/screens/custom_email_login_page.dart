import 'package:agro_pool/screens/dealer_home_page.dart';
import 'package:agro_pool/screens/farmer_home_page.dart';
import 'package:agro_pool/screens/dealer_registration_page.dart';
import 'package:agro_pool/screens/farmer_registration_page.dart';
import 'package:agro_pool/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agro_pool/animations/fadeanimation.dart';
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:agro_pool/utils/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class CustomEmailLoginPage extends StatefulWidget {
  @override
  _CustomEmailLoginPageState createState() => _CustomEmailLoginPageState();
}

class _CustomEmailLoginPageState extends State<CustomEmailLoginPage> {
  List<String> userType = ['select user', 'Farmer', 'Dealer'];
  String selectedUserType = 'select user';

  //textEditing controllers
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  //Global key for the Form
  final _formKey = GlobalKey<FormState>();

  //Getting the AuthService Instance
  final AuthService _authService = AuthService();

  bool inVisiblePass = true;
  bool isProgressVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.grey[300],
          child: ModalProgressHUD(
            inAsyncCall: isProgressVisible,
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 340,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/light-1.png')),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/light-2.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(
                              1.5,
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/clock.png'),
                                  ),
                                ),
                              )),
                        ),
                        Positioned(
                          child: FadeAnimation(
                              1.6,
                              Container(
                                margin: EdgeInsets.only(top: 50),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  FadeAnimation(
                    1.8,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 10.0),
                      child: Material(
                        elevation: 5.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        child: TextFormField(
                            validator: (email) =>
                                email.isEmpty ? 'Please Enter email' : null,
                            controller: emailTextEditingController,
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
                  ),
                  FadeAnimation(
                    1.9,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 10.0),
                      child: Material(
                        elevation: 5.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        child: TextFormField(
                            validator: (password) => password.length < 6
                                ? 'Password shouble be minimum 6 characters'
                                : null,
                            obscureText: inVisiblePass,
                            controller: passwordTextEditingController,
                            keyboardType: TextInputType.text,
                            style: kTextFieldTextStyle,
                            // imported from utils/constants.dart
                            decoration: kTextFieldDecoration.copyWith(
                                // imported from utils/constants.dart
                                hintText: 'Enter Your Passowrd',
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    icon: inVisiblePass
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        inVisiblePass = !inVisiblePass;
                                      });
                                    }))),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.95,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'User Type: ',
                            style: TextStyle(
                                color: Colors.brown[700],
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 80.0,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: DropdownButton(
                              value: selectedUserType,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 30.0,
                                color: Colors.blue,
                              ),
                              iconSize: 20.0,
                              items: userType.map<DropdownMenuItem<String>>(
                                  (String userType) {
                                return DropdownMenuItem<String>(
                                  value: userType,
                                  child: Text(userType),
                                );
                              }).toList(),
                              onChanged: (changedUser) {
                                setState(() {
                                  selectedUserType = changedUser;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FadeAnimation(
                    2.0,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 6.0),
                      child: Text(
                        'New User',
                        // imported from utils/constants.dart
                        style: kTextFieldTextStyle.copyWith(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    2.0,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Below to buttons are imported from components rounded_rectangle_button file
                          RoundedRectangleButton(
                            onPress: () {
                              if (selectedUserType == 'Farmer') {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  selectedUserType = 'select user';
                                  return FarmerRegisterScreen();
                                }));
                              } else if (selectedUserType == 'Dealer') {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  selectedUserType = 'select user';
                                  return DealerRegisterScreen();
                                }));
                              } else {
                                Toast.show('Pleas Select User Type', context,
                                    backgroundRadius: 18.0,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white);
                              }
                            },
                            buttonName: 'Register',
                            buttonColor: Colors.deepOrangeAccent,
                          ),
                          RoundedRectangleButton(
                            onPress: () async {
                              setState(() {
                                isProgressVisible = true;
                              });
                              //Here we are validating the form
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await _authService.signWithEmailAndPassword(
                                        email: emailTextEditingController.text,
                                        password:
                                            passwordTextEditingController.text);
                                if (result == null) {
                                  Toast.show('Something went wrong', context,
                                      duration: 2);
                                } else {
                                  Toast.show('Successfully login', context,
                                      duration: 2);
                                }
                              } else {
                                Toast.show(
                                    'Make sure all fields are entered or not',
                                    context,
                                    duration: 2);
                              }
                              setState(() {
                                isProgressVisible = false;
                              });
                            },
                            buttonName: 'Login',
                            buttonColor: Colors.blueAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FadeAnimation(
                    2.1,
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Toast.show('You are trying to change your Password',
                                context,
                                backgroundRadius: 18.0);
                          },
                          child: Text('Forgot Password.!',
                              // imported from utils/constants.dart
                              style: kTextFieldTextStyle.copyWith(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w800,
                                fontSize: 18.0,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
