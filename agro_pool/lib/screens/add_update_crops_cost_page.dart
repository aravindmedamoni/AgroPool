
import 'package:agro_pool/components/rounded_rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:agro_pool/utils/constants.dart';

class AddUpdateCropsCostPage extends StatefulWidget {

  @override
  _AddUpdateCropsCostPageState createState() => _AddUpdateCropsCostPageState();
}

class _AddUpdateCropsCostPageState extends State<AddUpdateCropsCostPage> {

  final List<String> crops = ['Select Crop','Paddy','Cotton','Rice','Carrot','Groundnut','Red gram'];

  String selectedCrop = 'Select Crop';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF014973),
        title: Text('Add/Update Crops cost Page'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[350],
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Crop Selection', style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.w800),),
                SizedBox(
                  height: MediaQuery.of(context).size.height/8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Select Crop :',style: TextStyle(color: Colors.brown[700],fontSize: 18.0,fontWeight: FontWeight.w500),),
                    SizedBox(
                      width: 30.0,
                    ),
                    // for crops
                    DropdownButton<String>(
                      itemHeight: 50.0,
                      items: crops.map<DropdownMenuItem<String>>((String dropDownMenuItem){
                        return DropdownMenuItem(
                          value: dropDownMenuItem,
                          child: Text(dropDownMenuItem),);
                      }).toList(),
                      value: selectedCrop,
                      elevation: 20,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18.0,
                      ),
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (newCropName){
                        setState(() {
                          selectedCrop = newCropName;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                            keyboardType: TextInputType.number,
                            style: kTextFieldTextStyle,
                            // imported from utils/constants.dart
                            decoration: kTextFieldDecoration.copyWith(
                              // imported from utils/constants.dart
                              hintText: 'Enter Crop Price',
                              prefixIcon: Icon(Icons.monetization_on),
                            )),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text('Rs.',style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w800),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0,top: 40.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                      child: RoundedRectangleButton(onPress: (){
                        Navigator.of(context).pop();
                      }, buttonName: 'Add/Update', buttonColor: Colors.deepPurple)),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
