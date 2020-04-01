
import 'dart:io';

import 'package:agro_pool/components/custom_appbar_widget.dart';
import 'package:agro_pool/components/fancy_floating_action_button.dart';
import 'package:agro_pool/screens/farmer_profile_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

class FarmerProfilePage extends StatefulWidget {

  @override
  _FarmerProfilePageState createState() => _FarmerProfilePageState();
}

class _FarmerProfilePageState extends State<FarmerProfilePage> {
  File _selectedImageFile;
  bool isInProgress = false;
  String userName = 'Sai Vardhan';
  String mobileNumber = '8179453944';
  String emailId = 'saivardhan@gmail.com';
  String farmerState = 'Telangana';
  String farmerDistrict = 'Hyderabad';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ModalProgressHUD(
            inAsyncCall: isInProgress,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      CustomAppBar(
                        height: MediaQuery.of(context).size.height/3.6,
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
                                  padding: const EdgeInsets.only(top:20.0),
                                  child: Text(userName,style: TextStyle(color: Colors.blueGrey,fontSize: 20.0,fontWeight: FontWeight.w700),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: FancyFloatingActionButton(fillColor: Color(0XFF014973),buttonName: 'Edit',buttonIcon: Icons.mode_edit,onPressed: (){
                                        Toast.show('You are trying to edit.', context,backgroundRadius: 18.0);
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return FarmerProfileEditScreen(
                                            userName: userName,
                                            mobileNumber: mobileNumber,
                                            emailId: emailId,
                                            farmerState: farmerState,
                                            farmerDistrict: farmerDistrict,
                                          );
                                        }));
                                    }),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: ListView(
                                      children: <Widget>[
                                        ListTile(
                                          leading: Icon(Icons.phone_forwarded),
                                          title: Text('Mobile Number'),
                                          subtitle: Text(mobileNumber),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.mail),
                                          title: Text('Email Id'),
                                          subtitle: Text(emailId),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.location_city),
                                          title: Text('Farmer State'),
                                          subtitle: Text(farmerState),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.location_on),
                                          title: Text('Farmer District'),
                                          subtitle: Text(farmerDistrict),
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

                          child: getImageProfileImage(),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height/16,
                        right: MediaQuery.of(context).size.width/3.5,
                        child: RawMaterialButton(
                          shape: CircleBorder(side: BorderSide(color: Colors.white,width: 2,style: BorderStyle.solid)),
                          constraints: BoxConstraints.tightFor(
                              width: 40.0,
                              height: 40.0
                          ),
                          fillColor: Color(0xFF4c4f5e),
                          child: Icon(Icons.edit,color: Colors.white,),
                          onPressed: (){
                           // Toast.show('edit button clicked', context,backgroundRadius: 18.0);
                            showDialogMessage(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget getImageProfileImage() {

    if(_selectedImageFile != null){
      return Image.file(_selectedImageFile,
        width: MediaQuery.of(context).size.width/3,
        height: MediaQuery.of(context).size.height/5.2,
        fit: BoxFit.cover,
      );
    }else{
      return Image.asset('images/agroprofile.jpeg',width: MediaQuery.of(context).size.width/3,
        height: MediaQuery.of(context).size.height/5.2,);
    }
  }

  getImage(ImageSource imageSource) async{
    this.setState(() {
      isInProgress = true;
    });
    File image = await ImagePicker.pickImage(source: imageSource);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(sourcePath: image.path,
            aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1.2),
            maxHeight: 500,
            maxWidth: 500,
            compressQuality: 100,
            compressFormat: ImageCompressFormat.jpg,
              androidUiSettings: AndroidUiSettings(
                  toolbarTitle: 'Cropper',
                  toolbarColor: Colors.deepOrange,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.original,
                  lockAspectRatio: false),
              iosUiSettings: IOSUiSettings(
                minimumAspectRatio: 1.0,
              )
          );
      setState(() {
        _selectedImageFile = cropped;
        isInProgress = false;
      });
    } else {
      setState(() {
        isInProgress = false;
      });
      Toast.show('No Image is selected', context,backgroundRadius: 18.0);
    }
  }

  void showDialogMessage(BuildContext context) {
     showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text('Select Image'),
        content: Text('Choose One',style: TextStyle(color: Colors.deepOrangeAccent),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20.0,bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.camera,size: 40.0,color: Colors.orange,), onPressed: (){
                      getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    }),
                    Text('Camera')
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/14,
                ),
                Column(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.delete_forever,size: 40.0,color: Colors.deepOrange,), onPressed: (){
                      setState(() {
                        _selectedImageFile = null;
                      });
                      Navigator.of(context).pop();
                    }),
                    Text('Set Default')
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/14,
                ),
                Column(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.image,size: 40.0,color: Colors.greenAccent), onPressed: (){
                      getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    }),
                    Text('Gallery')
                  ],
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
