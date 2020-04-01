import 'package:agro_pool/model/user.dart';
import 'package:agro_pool/screens/dealer_home_page.dart';
import 'package:agro_pool/screens/farmer_home_page.dart';
import 'package:agro_pool/screens/dealer_registration_page.dart';
import 'package:agro_pool/screens/farmer_registration_page.dart';
import 'package:agro_pool/screens/custom_email_login_page.dart';
import 'package:agro_pool/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agro_pool/animations/fadeanimation.dart';
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:agro_pool/utils/constants.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class LoginPageWithApi extends StatefulWidget {
  @override
  _LoginPageWithApiState createState() => _LoginPageWithApiState();
}

class _LoginPageWithApiState extends State<LoginPageWithApi> {
  List<String> userType = ['user type', 'Farmer', 'Dealer'];
  String selectedUserType = 'user type';

  bool isProgressVisible = false;

  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.grey[300],
          child: ModalProgressHUD(
            inAsyncCall: isProgressVisible,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
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
                    1.95,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Select User : ',
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
                  FadeAnimation(
                    1.80,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: FlatButton(
                          splashColor: Colors.grey,
                          color: Colors.white,
                          onPressed: () async{
                            Toast.show('you tapped me', context);
                            dynamic result = await _authService.signInWithGoogle();

                            if(result != null){
                              print('User name : ${result.uid}');
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>FarmerHomePage()));
                            }else{
                              Toast.show('Some thing Went wrong', context,duration: 2);
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image(
                                  image: AssetImage("images/googleicon.png"),
                                  height: 35.0,
                                  width: 35.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FadeAnimation(
                      1.85,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: FlatButton(
                          onPressed: () async{
                            dynamic user = await _authService.signInWithFacebook();
                            if(user != null){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>FarmerHomePage()));
                            }else{
                              Toast.show('Something went wrong', context,duration: 2);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0.0),
                            child: ListTile(
                              leading: Image.asset(
                                'images/fblogo.png',
                                width: 35,
                                height: 30,
                              ),
                              title: Text(
                                'Login with Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          color: Color(0xFF3A5794),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                        ),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  FadeAnimation(
                      1.85,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: FlatButton(
                          onPressed: () async{
                            dynamic user = await _authService.signInWithTwitter();
                            if(user != null){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>FarmerHomePage()));
                            }else{
                              Toast.show('Something went wrong', context,duration: 2);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0.0),
                            child: ListTile(
                              leading: Image.asset(
                                'images/twitterlogo.png',
                                width: 35,
                                height: 30,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Login with Twitter',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          color: Color(0xFF0FA9E8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                        ),
                      )),
                  SizedBox(
                    height: 16.0,
                  ),
                  FadeAnimation(
                    1.90,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Stack(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.black),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'OR',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                          ),
                          Divider(
                            height: 0,
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FadeAnimation(
                    1.95,
                    GestureDetector(
                      child: Center(
                        child: Text(
                          'Login With Custom email and Password',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomEmailLoginPage()));
                      },
                    ),
                  ),
                Center(
                  child: RaisedButton(
                    onPressed: () async {
                      await _authService.logOut();
                      Toast.show('You logged out', context, duration: 2);
                    },
                    child: Text('Sign Out'),
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
