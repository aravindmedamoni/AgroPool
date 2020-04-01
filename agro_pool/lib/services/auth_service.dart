import 'dart:math';

import 'package:agro_pool/model/user.dart';
import 'package:agro_pool/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Getting Firebase Info

  //Firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Firebase user
  FirebaseUser fUser;

  //Google Sign In
  GoogleSignIn _googleSignIn = GoogleSignIn();

  //Facebook Sign In
  FacebookLogin _fbLogin = FacebookLogin();

  //Twitter Login
  TwitterLogin _twitterLogin = TwitterLogin(
      consumerKey: 'consumerkey',
      consumerSecret: 'secretkey');

  //Check weather the user logged in or not by using authState

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_customUserFroFirebaseUser);
  }

  //Getting the custom user from firebase user
  User _customUserFroFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //Sign in with google api
  Future<User> signInWithGoogle() async {
    try {
      GoogleSignInAccount result = await _googleSignIn.signIn();
      GoogleSignInAuthentication gglAuth = await result.authentication;
      AuthCredential credentials = GoogleAuthProvider.getCredential(
          idToken: gglAuth.idToken, accessToken: gglAuth.accessToken);
      AuthResult signInResult = await _auth.signInWithCredential(credentials);
      fUser = signInResult.user;
      //This is userData map
      var userData = {
        'email' : fUser.email,
        'name' : fUser.displayName,
        'mobileNumber' : fUser.phoneNumber
      };
      //Here we are storing the user data into the firestore in particular document with user id
      await DatabaseService(uid: fUser.uid).updateUserData(userData);
      return _customUserFroFirebaseUser(fUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign In with facebook api
  Future signInWithFacebook() async {
    try {
      FacebookLoginResult fblgnResult =
          await _fbLogin.logIn(['email', 'public_profile']);
      switch (fblgnResult.status) {
        case FacebookLoginStatus.loggedIn:
          AuthCredential credentials = FacebookAuthProvider.getCredential(
              accessToken: fblgnResult.accessToken.token);
          AuthResult signInResult =
              await _auth.signInWithCredential(credentials);
          fUser = signInResult.user;
          // User data map
          var userData = {
            'email' : fUser.email,
            'name' : fUser.displayName,
            'mobileNumber' : fUser.phoneNumber
          };
          //Here we are storing the user data into the firestore in particular document with user id
          await DatabaseService(uid: fUser.uid).updateUserData(userData);
          return _customUserFroFirebaseUser(fUser);
          break;
        case FacebookLoginStatus.cancelledByUser:
          print("user cancelled");
          return null;
          break;
        case FacebookLoginStatus.error:
          print("SomeThing went wrong ");
          return null;
          break;
      }
    } catch (e) {
      print('fb Login Error : ${e.toString()}');
      return null;
    }
  }

  // Sign in with twitter api
  Future signInWithTwitter() async {
    TwitterLoginResult twLgnResult = await _twitterLogin.authorize();
    switch (twLgnResult.status) {
      case TwitterLoginStatus.loggedIn:
        AuthCredential credentials = TwitterAuthProvider.getCredential(
            authToken: twLgnResult.session.token,
            authTokenSecret: twLgnResult.session.secret);
        AuthResult signInResult = await _auth.signInWithCredential(credentials);
        fUser = signInResult.user;
        //User data map
        var userData = {
          'email' : fUser.email,
          'name' : fUser.displayName,
          'mobileNumber' : fUser.phoneNumber
        };
        //Here we are storing the user data into the firestore in particular document with user id
        await DatabaseService(uid: fUser.uid).updateUserData(userData);
        return _customUserFroFirebaseUser(fUser);
        break;
      case TwitterLoginStatus.cancelledByUser:
        print("user cancelled");
        return null;
        break;
      case TwitterLoginStatus.error:
        print("SomeThing went wrong ");
        return null;
        break;
    }
  }

  //create function to register with custom email and password
  Future<User> registerWithEmailAndPassword({String email, String password, String name, String mobileNumber, String rgtrNumOrCropName, String district}) async{
    try {
      AuthResult signInResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      fUser = signInResult.user;
      //User data map
      var userData = {
        'email' : email,
        'name' : name,
        'mobileNumber' : mobileNumber,
        'rgstrOrCropName' : rgtrNumOrCropName,
        'district' : district
      };
      //Here we are storing the user data into the firestore in particular document with user id
      await DatabaseService(uid: fUser.uid).updateUserData(userData);
      return _customUserFroFirebaseUser(fUser);
    } catch (e) {
      print('Custom email n password Error : ${e.toString()}');
      return null;
    }
  }

  //Sign In function to login the user with his email and password
  Future<User> signWithEmailAndPassword({String email, String password}) async{
    try {
      AuthResult signInResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      fUser = signInResult.user;
      return _customUserFroFirebaseUser(fUser);
    } catch (e) {
      print('Custom email n password Error : ${e.toString()}');
      return null;
    }
  }

  //Function for logout the user
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('Logout error : ${e.toString()}');
      return null;
    }
  }
}
