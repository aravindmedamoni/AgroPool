
import 'package:agro_pool/components/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FarmerInformationPage extends StatelessWidget {

  final String farmerName;
  final String cropName;


  FarmerInformationPage({this.farmerName, this.cropName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    CustomAppBar(
                      height: MediaQuery.of(context).size.height/3.6,
                      trailIconButton:Icons.phone_forwarded,
                      onPress: (){
                        Toast.show('You are trying to connect with him', context,backgroundRadius: 18);
                      },
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height/3.6,
                      child: Container(
                        color: Colors.blueGrey,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      left:  MediaQuery.of(context).size.width/14.0,
                      right:  MediaQuery.of(context).size.width/14.0,
                      top: MediaQuery.of(context).size.height/5.0,
                      bottom: MediaQuery.of(context).size.height/10.0,
                      child: Container(
                        height: MediaQuery.of(context).size.height/1.2,
                        width: MediaQuery.of(context).size.width/1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top:18.0),
                                child: Text('$farmerName',style: TextStyle(color: Colors.blueGrey,fontSize: 20.0,fontWeight: FontWeight.w700),),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: ListView(
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(Icons.monetization_on),
                                        title: Text('Crop Name'),
                                        subtitle: Text('$cropName'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.phone_forwarded),
                                        title: Text('Mobile Number'),
                                        subtitle: Text('8179453944'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.mail),
                                        title: Text('Email Id'),
                                        subtitle: Text('$farmerName@gmail.com'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.location_city),
                                        title: Text('Farmer State'),
                                        subtitle: Text('Telangana'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.location_on),
                                        title: Text('Farmer District'),
                                        subtitle: Text('Hyderabad'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height/11,
                      left:  MediaQuery.of(context).size.width/3,
                      right:  MediaQuery.of(context).size.width/3,
                      child: Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: MediaQuery.of(context).size.height/5.2,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 3.0,
                              style: BorderStyle.solid,
                            )
                        ),

                        child: Image.asset('images/agroprofile.jpeg',fit: BoxFit.cover,),
                      ),
                    ),
//                    Positioned(
//                      top: MediaQuery.of(context).size.height/16,
//                      right: MediaQuery.of(context).size.width/3.5,
//                      child: RawMaterialButton(
//                        shape: CircleBorder(),
//                          constraints: BoxConstraints.tightFor(
//                            width: 40.0,
//                            height: 40.0
//                          ),
//                          fillColor: Color(0xFF4c4f5e),
//                          child: Icon(Icons.edit,color: Colors.white,),
//                        onPressed: (){
//                          Toast.show('edit button clicked', context,backgroundRadius: 18.0);
//                        },
//                      ),
//                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
