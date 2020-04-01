
import 'package:agro_pool/components/fancy_floating_action_button.dart';
import 'package:agro_pool/model/user.dart';
import 'package:agro_pool/model/users_data.dart';
import 'package:agro_pool/services/database_service.dart';
import 'package:agro_pool/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class FarmerProfileEditScreen extends StatefulWidget {
//  final String mobileNumber;
//  final String userName;
//  final String emailId;
//  final String farmerState;
//  final String farmerDistrict;
//
//
//  FarmerProfileEditScreen({this.mobileNumber, this.userName, this.emailId,
//      this.farmerState, this.farmerDistrict});

 //Global key for the form
  @override
  _FarmerProfileEditScreenState createState() => _FarmerProfileEditScreenState();
}

class _FarmerProfileEditScreenState extends State<FarmerProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();

  String name,state,district,mobileNumber;

  @override
  Widget build(BuildContext context) {

    //User instance
    final user = Provider.of<User>(context);
    //UserData instance
    UsersData userData;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Edit Screen'),
        backgroundColor: Color(0XFF014973),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text('Edit Details', style: TextStyle(color: Colors.purple,fontSize: 22.0,fontWeight: FontWeight.w600),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: StreamBuilder(
                  stream: DatabaseService(uid: user.uid).userData,
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return Center(
                        child: SpinKitCircle(
                          color: Color(0XFF028D8F),
                          size: 60.0,
                        ),
                      );
                    }else{
                      userData = snapshot.data;
                      return  Form(
                        key: _formKey,
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: TextFormField(
                                initialValue: userData.name,
                                validator: (name) => name.isEmpty ? 'please enter name' : null,
                                keyboardType: TextInputType.text,
                                style: kTextFieldTextStyle.copyWith(
                                  fontSize: 18.0,
                                ),
                                onChanged: (name){
                                  setState(() {
                                    this.name = name;
                                  });
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person,),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 2.0,style: BorderStyle.solid)
                                    ),
                                    labelText: 'User Name',
                                    labelStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: TextFormField(
                                validator: (mobileNumber) => mobileNumber.length < 10 ? 'Enter valid mobile Number' : null,
                                initialValue: userData.mobileNumber,
                                keyboardType: TextInputType.number,
                                style: kTextFieldTextStyle.copyWith(
                                  fontSize: 18.0,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.call,),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 2.0,style: BorderStyle.solid)
                                    ),
                                    labelText: 'Mobile Number',
                                    labelStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                                onChanged: (mobileNum){
                                  setState(() {
                                    mobileNumber = mobileNum;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: TextFormField(
                                validator: (email) => email.isEmpty ? 'Enter valid email' : null,
                                initialValue: userData.email,
                                enabled: false,
                                keyboardType: TextInputType.emailAddress,
                                style: kTextFieldTextStyle.copyWith(
                                  fontSize: 18.0,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email,),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 2.0,style: BorderStyle.solid)
                                    ),
                                    labelText: 'Email Id',
                                    labelStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: TextFormField(
                                validator: (stateName) => stateName.isEmpty ? 'Enter your state name' : null,
                                initialValue: userData.state,
                                onChanged: (state){
                                  setState(() {
                                    this.state = state;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                style: kTextFieldTextStyle.copyWith(
                                  fontSize: 18.0,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.location_city,),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 2.0,style: BorderStyle.solid)
                                    ),
                                    labelText: 'Farmer State',
                                    labelStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: TextFormField(
                                validator: (district) => district.isEmpty ? 'Enter your district name' : null,
                                initialValue: userData.district,
                                onChanged: (district){
                                  setState(() {
                                    this.district = district;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                style: kTextFieldTextStyle.copyWith(
                                  fontSize: 18.0,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.location_on,),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 2.0,style: BorderStyle.solid)
                                    ),
                                    labelText: 'Farmer District',
                                    labelStyle: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0,right: 60.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FancyFloatingActionButton( buttonIcon: Icons.save,buttonName: 'Save',fillColor:Color(0XFF014973),
                    onPressed: () async{
                  if(_formKey.currentState.validate()){
                    var userDataMap = {
                      'email' : userData.email,
                      'name' : name ?? userData.name,
                      'mobileNumber' : mobileNumber ?? userData.mobileNumber,
                      'district' : district ?? userData.district,
                      'state' : state ?? userData.state
                    };
                    await DatabaseService(uid: user.uid).updateUserData(userDataMap);
                    Toast.show('Updated successfully', context,duration: 2);
                    Navigator.of(context).pop();
                  }else{
                    Toast.show('Make sure all fields required', context,duration: 2);
                  }

                }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
