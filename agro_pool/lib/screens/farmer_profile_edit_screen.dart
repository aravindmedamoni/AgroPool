
import 'package:agro_pool/components/fancy_floating_action_button.dart';
import 'package:agro_pool/utils/constants.dart';
import 'package:flutter/material.dart';

class FarmerProfileEditScreen extends StatelessWidget {
  final String mobileNumber;
  final String userName;
  final String emailId;
  final String farmerState;
  final String farmerDistrict;


  FarmerProfileEditScreen({this.mobileNumber, this.userName, this.emailId,
      this.farmerState, this.farmerDistrict});

 final mobileNumberController = TextEditingController();
 final userNameController = TextEditingController();
 final emailIdController = TextEditingController();
 final farmerStateController = TextEditingController();
 final farmerDistrictController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    userNameController.text = userName;
    mobileNumberController.text = mobileNumber;
    emailIdController.text = emailId;
    farmerStateController.text = farmerState;
    farmerDistrictController.text = farmerDistrict;

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
              child: Text('Edit Details', style: TextStyle(color: Colors.purple,fontSize: 26.0,fontWeight: FontWeight.w600),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextField(
                        controller: userNameController,
                        keyboardType: TextInputType.text,
                        style: kTextFieldTextStyle.copyWith(
                          fontSize: 18.0,
                        ),
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
                      child: TextField(
                        controller: mobileNumberController,
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextField(
                        controller: emailIdController,
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
                      child: TextField(
                        controller: farmerStateController,
                        enabled: false,
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
                      child: TextField(
                        controller: farmerDistrictController,
                        enabled: false,
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0,right: 60.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FancyFloatingActionButton( buttonIcon: Icons.save,buttonName: 'Save',fillColor:Color(0XFF014973),onPressed: (){
                  Navigator.of(context).pop();
                }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
