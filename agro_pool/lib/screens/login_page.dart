import 'package:agro_pool/screens/home_page.dart';
import 'package:agro_pool/screens/registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agro_pool/animations/fadeanimation.dart';
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:agro_pool/utils/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> userType = ['select user','Farmer', 'Dealer'];
  String selectedUserType = 'select user';

  //textEditing controllers
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  bool inVisiblePass = true;
  bool isProgressVisible = false;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }
  //Getting Firebase Info
  final _auth = FirebaseAuth.instance;
  FirebaseUser currentUser;

  getCurrentUser() async{
    try {
      currentUser = await _auth.currentUser();
      if (currentUser != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      } else {

      }
    } catch (e) {
      print(e);
    }

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
                    padding:
                        const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                    child: Material(
                      elevation: 5.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      child: TextField(
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
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
                ),
                FadeAnimation(
                  1.95,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        Text('User Type: ',style: TextStyle(color: Colors.brown[700],fontWeight: FontWeight.w500,fontSize: 18.0),),
                        SizedBox(
                          width: 80.0,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: DropdownButton(
                            value: selectedUserType,
                            icon: Icon(Icons.arrow_downward,size: 18.0,),
                            iconSize: 20.0,
                            items: userType.map<DropdownMenuItem<String>>((String userType) {
                              return DropdownMenuItem<String>(
                                value: userType,
                                child: Text(userType),
                              );
                            }).toList(),
                            onChanged: (changedUser){
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return RegisterScreen();
                            }));
                          },
                          buttonName: 'Register',
                          buttonColor: Colors.deepOrangeAccent,
                        ),
                        RoundedRectangleButton(
                          onPress: () async {
                            setState(() {
                              isProgressVisible = true;
                            });
                            try {
                              final user = await _auth.signInWithEmailAndPassword(email: emailTextEditingController.text, password: passwordTextEditingController.text);

                              if(user != null){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return HomePage();
                                }));
                                Toast.show('Successfully Login', context,backgroundRadius: 16.0);
                              }else{
                                Toast.show('Login Failed.', context,backgroundRadius: 16.0);
                              }
                              emailTextEditingController.clear();
                              passwordTextEditingController.clear();
                              setState(() {
                                isProgressVisible = false;
                              });
                            } catch (e) {
                              Toast.show('Login Failed due to ${e.toString()}', context,backgroundRadius: 16.0);
                              setState(() {
                                isProgressVisible = false;
                              });
                            }


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
                IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                  Navigator.of(context).pop();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


